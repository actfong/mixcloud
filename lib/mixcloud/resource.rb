module Mixcloud
  class Resource
    include Mixcloud::UrlFixer

    def initialize(url)
      url_with_metadata = concat_with_metadata(url)
      data_hash = JSON.parse RestClient.get(url_with_metadata)
      klass =  Mixcloud.const_get(data_hash['type'].capitalize)
      prevent_url_and_class_mismatch(klass)
      map_to_resource_attributes(data_hash)
    end


    ###########################################
    private

    def prevent_url_and_class_mismatch(klass)
      if klass != self.class
        raise "You tried to create an object of #{self.class} with an URL of object type #{klass}"
      end
    end

    def map_to_resource_attributes(data_hash)
      data_hash.each_pair do | key, value |
        next if ['metadata', 'sections', 'tags', 'type'].include?(key)
        create_picture_url_methods(value) and next if key == 'pictures'
        key,value = set_associated_object_urls(key, value) if Mixcloud.const_defined?(key.capitalize)
        send("#{key}=", value) 
      end
    end

    def create_picture_url_methods(picture_hash)
      picture_hash.each_pair do |format, picture_url|
        self.class.send(:define_method, "#{format}_picture_url") { picture_url }
      end
    end

    def set_associated_object_urls(key, value)
      variable_name = key + "_url"
      object_url = value['url'].gsub('http://www.', 'http://api.') + "?metadata=1"
      [ variable_name, object_url ]
    end
    ############################################
  end
end
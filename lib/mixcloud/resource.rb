module Mixcloud
  class Resource

    include UrlHelper
    def initialize(url)
      validate_mixcloud_url(url)
      url_with_metadata = concat_with_metadata(url)
      data_hash = grab_data_from_mixcloud(url_with_metadata)
      klass = determine_class_by_mixcloud_data(data_hash)
      prevent_url_and_class_mismatch(klass)
      map_to_resource_attributes(data_hash)
    end


    ###########################################
    private

    def grab_data_from_mixcloud(url_with_metadata)
      begin
        JSON.parse RestClient.get(url_with_metadata)
      rescue => e
        e.message.concat(". Are you sure you have connection with Mixcloud at the moment?")
        raise e
      end
    end

    def determine_class_by_mixcloud_data(data_hash)
      begin
        Mixcloud.const_get(data_hash['type'].capitalize) # it would take a change of Mixcloud API to get this line to fail
      rescue => e
        e.message.concat(". We can't find the key 'type'. Could it be that Mixcloud has changed its API?")
      end
    end

    def prevent_url_and_class_mismatch(klass)
      if klass != self.class
        raise Mixcloud::Error.new("You tried to create an object of #{self.class} with an URL of object type #{klass}")
      end
    end

    def map_to_resource_attributes(data_hash)
      data_hash.each_pair do | key, value |
        next if ['metadata', 'sections', 'tags', 'type'].include?(key)
        create_picture_url_methods(value) and next if key == 'pictures'
        set_public_and_api_urls(value) and next if key == 'url'
        key,value = set_associated_object_urls(key, value) if Mixcloud.const_defined?(key.capitalize)
        send("#{key}=", value) 
      end
    end

    def create_picture_url_methods(picture_hash)
      picture_hash.each_pair do |format, picture_url|
        self.class.send(:define_method, "#{format}_picture_url") { picture_url }
      end
    end

    def set_public_and_api_urls(url_string)
      send("public_url=", url_string)
      send("api_url=", turn_www_to_api(url_string)).concat('?metadata=1')
    end

    def set_associated_object_urls(key, value)
      variable_name = key + "_url"
      object_url = turn_www_to_api(value['url']).concat('?metadata=1')
      [ variable_name, object_url ]
    end

    ############################################
  end
end
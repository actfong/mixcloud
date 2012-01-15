module Mixcloud
  class Resource
    include Mixcloud::UrlFixer
    def initialize(url)
      url = concat_with_metadata(url)
      resource = JSON.parse RestClient.get(url)
      type =  Mixcloud.const_get(resource['type'].capitalize)
      prevent_url_and_class_mismatch(type)
      resource.each_pair do |key, value|
        create_picture_urls(value) if key == 'pictures'
        if Mixcloud.const_defined?(key.capitalize)
          key = key + "_url"
          value = value['url'].gsub('http://www.', 'http://api.') + "?metadata=1"
          self.class.send(:define_method, key ) do
            value
          end
          next
        end
        unless ['metadata', 'sections', 'pictures', 'tags'].include?(key)
          send("#{key}=", value) 
        end
      end
    end


    ###########################################
    private

    def prevent_url_and_class_mismatch(type)
      if type != self.class
        raise "You tried to create an object of #{self.class} with an URL of object type #{type}"
      end
    end

    def create_picture_urls(picture_hash)
      picture_hash.each_pair do |format, url|
        self.class.send(:define_method, "#{format}_picture_url") do
          url
        end
      end
    end

  end
end
module Mixcloud
  class Resource
    def initialize(url)
      resource = JSON.parse RestClient.get(url)
      resource.each_pair do |key, value|

        if key == 'pictures'
          value.each_pair do |format, url|
            self.class.send(:define_method, "#{format}_picture_url") do
              url
            end
          end
        end

        if Mixcloud.const_defined?(key.capitalize)
          key = key + "_url"
          value = value['url'].gsub 'http://www.', 'http://api.'
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

  end
end
module Mixcloud

  module UrlHelper
  ##################################
    public
    def validate_mixcloud_url(url)
      raise Mixcloud::Error.new("You provided an invalid Mixcloud-API url. It must start with http://api.mixcloud.com/") unless url =~ /\Ahttp:\/\/api.mixcloud.com\//
    end

    def concat_with_metadata(url)
      return url if ends_with_metadata?(url)
      return url.chop if ends_with_metadata_slash?(url)
      url.concat('/') unless ends_with_slash?(url)
      url.concat('?metadata=1')
    end

    def turn_www_to_api(url)
      url.strip.sub('://www.', '://api.' )
    end
  ##################################
    private 
    def ends_with_metadata?(url)
      true if url =~ /\?metadata=1$/
    end

    def ends_with_metadata_slash?(url)
      true if url =~ /\?metadata=1\/$/
    end

    def ends_with_slash?(url)
      url =~ /\/\z/
    end
  ##################################
  end
end
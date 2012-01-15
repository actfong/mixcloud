module Mixcloud
  module UrlFixer

    private
    def concat_with_metadata(url)
      return url if ends_with_metadata?(url)
      return url.chop if ends_with_metadata_slash?(url)
      url.concat('/') unless ends_with_slash?(url)
      url.concat('?metadata=1') 
    end

    def ends_with_metadata?(url)
      true if url =~ /\?metadata=1$/
    end

    def ends_with_metadata_slash?(url)
      true if url =~ /\?metadata=1\/$/
    end

    def ends_with_slash?(url)
      url =~ /\/\z/
    end
  end
end
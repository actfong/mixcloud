module Mixcloud
  class Artist < Resource
    include Mixcloud::PopularNewHot
    attr_accessor :name, 
                  :url,
                  :key,
                  :type,
                  :slug

    def self.find_by_slug(slug)
      url = "http://api.mixcloud.com/artist/#{slug}/?metadata=1"
      self.new(url) if JSON.parse RestClient.get(url)
    end
  end
end
module Mixcloud
  class Track < Mixcloud::Resource
    include PopularNewHot
    attr_accessor :url,
                  :name,
                  :key,
                  :slug,
                  :type,
                  :artist

    def artist
      @artist ||= Artist.new(artist_url)
    end
  end
end

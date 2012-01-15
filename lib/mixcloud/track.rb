module Mixcloud
  class Track < Mixcloud::Resource
    include PopularNewHot
    attr_accessor :url,
                  :name,
                  :key,
                  :slug,
                  :artist_url
    # This class contains the following instance methods
    # #popular_url
    # #new_url
    # #hot_url
  end
end

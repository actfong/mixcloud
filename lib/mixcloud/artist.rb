module Mixcloud
  class Artist < Resource
    include Mixcloud::PopularNewHot
    attr_accessor :name, 
                  :url,
                  :key,
                  :slug
    # This class contains the following instance methods
    # #popular_url
    # #new_url
    # #hot_url
  end
end
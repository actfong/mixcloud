module Mixcloud
  class Tag < Mixcloud::Resource
    include Mixcloud::PopularNewHot
    attr_accessor :url, 
                  :name,
                  :key
    # This class contains the following instance methods
    # #popular_url
    # #new_url
    # #hot_url
  end
end
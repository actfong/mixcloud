module Mixcloud
  class Artist < Resource
    include Mixcloud::PopularNewHot
    attr_accessor :name, 
                  :key,
                  :slug,
                  :public_url,
                  :api_url
    # This class contains the following instance methods
    # #popular_url
    # #new_url
    # #hot_url
  end
end
module Mixcloud
  class Artist < Resource
    include Mixcloud::PopularNewHot
    attr_accessor :name, 
                  :url,
                  :key,
                  :type,
                  :slug
  end
end
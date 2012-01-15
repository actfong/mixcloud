module Mixcloud
  class Tag < Mixcloud::Resource
    include Mixcloud::PopularNewHot
    attr_accessor :url, 
                  :name,
                  :key
  end
end
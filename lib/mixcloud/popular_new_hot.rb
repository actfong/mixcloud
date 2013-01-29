module Mixcloud
  module PopularNewHot
    def self.included(base)
      base.class_eval{include UrlHelper} unless base.include?(UrlHelper)
    end
    
    def popular_url
      turn_www_to_api(@public_url).concat 'popular/'
    end

    def new_url
      turn_www_to_api(@public_url).concat 'new/'
    end

    def hot_url
      turn_www_to_api(@public_url).concat 'hot/'
    end
  end
end
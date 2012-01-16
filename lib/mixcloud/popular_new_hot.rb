module Mixcloud
  module PopularNewHot
    def popular_url
      UrlHelper.turn_www_to_api(@public_url).concat 'popular/'
    end

    def new_url
      UrlHelper.turn_www_to_api(@public_url).concat 'new/'
    end

    def hot_url
      UrlHelper.turn_www_to_api(@public_url).concat 'hot/'
    end
  end
end
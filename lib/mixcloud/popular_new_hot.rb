module Mixcloud
  module PopularNewHot
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
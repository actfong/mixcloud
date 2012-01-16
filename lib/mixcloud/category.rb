module Mixcloud
  class Category < Mixcloud::Resource
    attr_accessor :name, 
                  :format,
                  :public_url,
                  :api_url,
                  :key,
                  :slug

    # This class contains the following instance methods:
    # #small_picture_url
    # #large_picture_url
    # #medium_picture_url
    # #thumbnail_picture_url
    # #medium_mobile_picture_url
    # #userpick_users_url 
    # #userpick_cloudcasts_url
    # #users_url
    # #cloudcasts_url

    ['userpick_users', 'userpick_cloudcasts', 'users', 'cloudcasts' ].each do | connection |
      define_method "#{connection}_url" do
        turn_www_to_api(@public_url).concat "#{connection.gsub("_", "-")}/"
      end
    end
  end
end
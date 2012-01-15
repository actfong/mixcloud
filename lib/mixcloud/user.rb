module Mixcloud
  class User < Mixcloud::Resource
    attr_accessor :username, 
                  :name,
                  :cloudcast_count,
                  :following_count,
                  :url,
                  :listen_count,
                  :key,
                  :follower_count,
                  :favorite_count,
                  :updated_time,
                  :created_time,
                  :pictures,
                  :type,
                  :city,
                  :biog,
                  :country

    # This class contains the following instance methods
    # #medium_picture_url
    # #extra_large_picture_url
    # #large_picture_url
    # #small_url
    # #medium_mobile_picture_url
    # #thumbnail_picture_url
    # #feed_url
    # #playlists_url
    # #comments_url
    # #followers_url
    # #favorites_url
    # #following_url
    # #cloudcasts_url
    # #listens_url
    ['feed', 'playlists', 'comments', 'followers', 'favorites', 'following', 'cloudcasts', 'listens'].each do |connection|
      define_method "#{connection}_url" do
        "http://api.mixcloud.com#{@key}#{connection}/"
      end
    end

  end
end
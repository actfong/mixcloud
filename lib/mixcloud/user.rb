module Mixcloud
  class User < Mixcloud::Resource
    # include Mixcloud::HasPictures
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

    ['feed', 'playlists', 'comments', 'followers', 'favorites', 'following', 'cloudcasts', 'listens'].each do |connection|
      define_method "#{connection}_url" do
        "http://api.mixcloud.com#{@key}#{connection}/"
      end
    end

  end
end
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
                  :metadata,
                  :type,
                  :city,
                  :biog,
                  :country

    CONNECTIONS = ['feed', 'playlists', 'comments', 'followers', 'favorites', 'following', 'cloudcasts', 'listens']
    CONNECTIONS.each do |connection|
      define_method connection.gsub("-", "_") do
        @metadata['connections']["#{connection}"]
      end
    end

  end
end
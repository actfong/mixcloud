module Mixcloud
  class Cloudcast < Mixcloud::Resource
    attr_accessor :listener_count,
                  :name,
                  :url,
                  :description,
                  :updated_time,
                  :play_count,
                  :comment_count,
                  :percentage_music,
                  :key,
                  :created_time,
                  :audio_length,
                  :type,
                  :slug,
                  :favorite_count

   # This class contains the following instance methods
   # #medium_picture_url
   # #extra_large_picture_url
   # #large_picture_url
   # #small_url
   # #medium_mobile_picture_url
   # #thumbnail_picture_url
   # #listeners_url,
   # #similar_url,
   # #favorites_url,
   # #comments_url

   ['listeners', 'similar', 'favorites', 'comments'].each do | connection |
      define_method "#{connection}_url" do
        @url.gsub('http://www', 'http://api') + "#{connection.gsub("_", "-")}/"
      end
    end

  end
end
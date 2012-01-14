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
                  :user, # associated object
                  :key,
                  :created_time,
                  :audio_length,
                  :type,
                  :slug,
                  :favorite_count


    # This class contains the following instance methods
    # listeners_url,
    # similar_url,
    # favorites_url,
    # comments_url

   ['listeners', 'similar', 'favorites', 'comments'].each do | connection |
      define_method "#{connection}_url" do
        @url.gsub('http://www', 'http://api') + "#{connection.gsub("_", "-")}/"
      end
    end

    # instance methods to return a associated collection
    # def tags
    # end
    # 
    # def sections
    # end

  end
end
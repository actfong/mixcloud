module Mixcloud
  class Cloudcast < Mixcloud::Resource
    attr_accessor :listener_count,
                  :name,
                  :public_url,
                  :api_url,
                  :description,
                  :updated_time,
                  :play_count,
                  :comment_count,
                  :percentage_music,
                  :key,
                  :created_time,
                  :audio_length,
                  :slug,
                  :favorite_count,
                  :user_url

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
        UrlFixer.turn_www_to_api(@public_url) + "#{connection.gsub("_", "-")}/?metadata=1"
      end
    end

    def sections
      sections_hash = JSON.parse(RestClient.get @api_url)['sections']
      sections_array = []
      sections_hash.each do | section |
        sections_array << Mixcloud::Section.new(UrlFixer.turn_www_to_api(section['track']['url']), section['position'], section['start_type'], section['section_type'] )
      end
      sections_array
    end

    def tag_urls
      tags_hash = JSON.parse(RestClient.get @api_url)['tags']
      tags_urls_array = []
      tags_hash.each do | tag |
        tags_urls_array << UrlFixer.turn_www_to_api(tag['url']).concat('?metadata=1')
      end
      tags_urls_array
    end

  end
end
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
        UrlHelper.turn_www_to_api(@public_url) + "#{connection.gsub("_", "-")}/?metadata=1"
      end
    end

    def sections
      convert_hash_data_into_array_of('sections')
    end

    def tag_urls
      convert_hash_data_into_array_of('tags')
    end

    private
    def convert_hash_data_into_array_of(type)
      raise 'I only take sections of tags, dude' unless ['sections', 'tags'].include?(type)
      elements_hash = JSON.parse(RestClient.get @api_url)[type]
      objects_array = []
      elements_hash.each do | element |
        if type == 'sections'
          objects_array << Mixcloud::Section.new(UrlHelper.turn_www_to_api(element['track']['url']), element['position'], element['start_type'], element['section_type'] )
        elsif type == 'tags'
          objects_array << UrlHelper.turn_www_to_api(element['url']).concat('?metadata=1')
        end
      end
      objects_array
    end
  end
end
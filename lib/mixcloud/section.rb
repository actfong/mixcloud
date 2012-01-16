module Mixcloud
	class Section
		attr_accessor :track_url, :position, :start_time, :section_type
		
		def initialize(track_url, position, start_time, section_type)
			@track_url = track_url
			@position = position
			@start_time = start_time
			@section_type = section_type
		end
	end
end
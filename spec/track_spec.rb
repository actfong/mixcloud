require 'spec_helper'

describe "Mixcloud::Track" do

  before do
    FakeWeb.register_uri(:get, 'http://api.mixcloud.com/track/michael-jackson/everybody/?metadata=1',
                         :body => 'spec/json_responses/track_response.json',
                         :content_type => 'application/json')
  end

  subject { Mixcloud::Track.new('http://api.mixcloud.com/track/michael-jackson/everybody/?metadata=1') }

  specify { expect(subject.instance_variables).not_to include(:@metadata) }
  specify { expect(subject.instance_variables).not_to include(:@type) }

  # set by #set_associated_object_urls in Resource class
  specify { expect(subject.artist_url).to eq 'http://api.mixcloud.com/artist/michael-jackson/?metadata=1' }

  # public_url and api_url are set by #set_public_and_api_urls in Resource class
  specify { expect(subject.public_url).to eq 'http://www.mixcloud.com/track/michael-jackson/everybody/' }
  specify { expect(subject.api_url).to eq 'http://api.mixcloud.com/track/michael-jackson/everybody/?metadata=1' }

  # instance methods provided by the PopularNewHot module
  specify { expect(subject.popular_url).to eq 'http://api.mixcloud.com/track/michael-jackson/everybody/popular/' }
  specify { expect(subject.new_url).to eq 'http://api.mixcloud.com/track/michael-jackson/everybody/new/' }
  specify { expect(subject.hot_url).to eq 'http://api.mixcloud.com/track/michael-jackson/everybody/hot/' }
end

require 'spec_helper'

describe "Mixcloud::Track" do
  
  before do
    FakeWeb.register_uri(:get, "http://api.mixcloud.com/track/michael-jackson/everybody/?metadata=1", 
                         :body => 'spec/json_responses/track_response.json', 
                         :content_type => "application/json")
  end

  let(:track) { Mixcloud::Track.new('http://api.mixcloud.com/track/michael-jackson/everybody/?metadata=1') }
  subject { track }

  its(:instance_variables) { should_not include(:@metadata) }
  its(:instance_variables) { should_not include(:@type) }

  # set by #set_associated_object_urls in Resource class
  its(:artist_url) { should eq "http://api.mixcloud.com/artist/michael-jackson/?metadata=1" }
  
  # public_url and api_url are set by #set_public_and_api_urls in Resource class
  its(:public_url) { should eq "http://www.mixcloud.com/track/michael-jackson/everybody/" }
  its(:api_url) { should eq "http://api.mixcloud.com/track/michael-jackson/everybody/?metadata=1" }
  
  # instance methods provided by the PopularNewHot module
  its(:popular_url) { should eq 'http://api.mixcloud.com/track/michael-jackson/everybody/popular/' }
  its(:new_url) { should eq 'http://api.mixcloud.com/track/michael-jackson/everybody/new/' }
  its(:hot_url) { should eq 'http://api.mixcloud.com/track/michael-jackson/everybody/hot/' }
end
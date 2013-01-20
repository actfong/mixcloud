require 'spec_helper'

describe "Mixcloud::Track" do
  
  before do
    track_data = { "name"=>"Alter-Ego-Tate", 
                   "artist"=>{ "url"=>"http://www.mixcloud.com/artist/the-colonious/", 
                               "type"=>"artist", 
                               "name"=>"The Colonious", 
                               "key"=>"/artist/the-colonious/", 
                               "slug"=>"the-colonious" },
                   "url"=>"http://www.mixcloud.com/track/the-colonious/alter-ego-tate/", 
                   "key"=>"/track/the-colonious/alter-ego-tate/", 
                   "type"=>"track", "slug"=>"alter-ego-tate", 
                   "metadata"=>{ "connections"=>{
                                   "popular"=>"http://api.mixcloud.com/track/the-colonious/alter-ego-tate/popular/", 
                                   "new"=>"http://api.mixcloud.com/track/the-colonious/alter-ego-tate/new/",
                                   "hot"=>"http://api.mixcloud.com/track/the-colonious/alter-ego-tate/hot/"}}}
    JSON.stub(:parse).and_return(track_data)
  end

  let(:track) { Mixcloud::Track.new('http://api.mixcloud.com/track/the-colonious/alter-ego-tate/?metadata=1') }

  describe "instances" do
    it "should not have an instance variable named @metadata" do
      track.instance_variables.should_not include(:@metadata)
    end

    it "should have an instance variable named @artist_url" do
      track.instance_variables.should include(:@artist_url)
    end

    it "should have @artist_url set correctly" do
      track.artist_url.should eq 'http://api.mixcloud.com/artist/the-colonious/?metadata=1'
    end

    it "should have an instance variable named @public_url" do
      track.instance_variables.should include(:@public_url)
    end

    it "should have @public_url set correctly" do
      track.public_url.should eq 'http://www.mixcloud.com/track/the-colonious/alter-ego-tate/'
    end

    it "should have an instance variable named @api_url" do
      track.instance_variables.should include(:@api_url)
    end

    it "should have @api_url set correctly" do
      track.api_url.should eq 'http://api.mixcloud.com/track/the-colonious/alter-ego-tate/?metadata=1'
    end
  end

  describe '#popular_url' do
    it "should return the url of the most popular cloudcasts featuring this track" do
      track.popular_url.should eq 'http://api.mixcloud.com/track/the-colonious/alter-ego-tate/popular/'
    end
  end

  describe '#new_url' do
    it "should return the url of the latest cloudcasts featuring this track" do
      track.new_url.should eq 'http://api.mixcloud.com/track/the-colonious/alter-ego-tate/new/'
    end
  end
  
  describe '#hot_url' do
    it "should return the url of the 'hottest cloudcasts' featuring this track" do
      track.hot_url.should eq 'http://api.mixcloud.com/track/the-colonious/alter-ego-tate/hot/'
    end
  end

end
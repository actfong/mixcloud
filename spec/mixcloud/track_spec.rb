require 'mixcloud'

describe "Mixcloud::Track" do
  
  before(:all) do
    @track = Mixcloud::Track.new('http://api.mixcloud.com/track/the-colonious/alter-ego-tate/?metadata=1')
  end

  it "should not have an instance variable named @metadata" do
    @track.instance_variables.should_not include(:@metadata)
  end

  it "should return the url for its associated artist" do
    @track.artist_url.should eq "http://api.mixcloud.com/artist/the-colonious/"
  end

  it "should return the url for the most popular cloudcasts with this track" do
    @track.popular_url.should eq 'http://api.mixcloud.com/track/the-colonious/alter-ego-tate/popular/'
  end

  it "should return the url for the latest cloudcasts with this track" do
    @track.new_url.should eq 'http://api.mixcloud.com/track/the-colonious/alter-ego-tate/new/'
  end

  it "should return the url for the 'hottest cloudcasts' with this track" do
    @track.hot_url.should eq 'http://api.mixcloud.com/track/the-colonious/alter-ego-tate/hot/'
  end

  
  it "should return the url of associated artist" do
    @track.artist_url.should eq "http://api.mixcloud.com/artist/the-colonious/"
  end

  describe "#artist" do

    context "before #artist is called" do
      it "should not have @artist defined before calling #artist" do
        @track.instance_variables.should_not include(:@artist)
      end
    end

    context "once #artist is called" do
      it "should return the associated artist" do
        @track.artist.name.should eq "The Colonious"
      end
      
      it "should have @artist defined after calling #artist" do
        @track.instance_variables.should include(:@artist)
      end
      
      it "should return an object of Mixcloud::Artist class" do
        @track.artist.class.should == Mixcloud::Artist
      end
    end
  end
end
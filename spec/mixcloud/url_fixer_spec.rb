require 'mixcloud'

describe "Mixcloud::UrlFixer" do
  
  before do
    artist_data = {"name"=>"Aphex Twin",
                     "url"=>"http://www.mixcloud.com/artist/aphex-twin/",
                     "key"=>"/artist/aphex-twin/",
                     "type"=>"artist",
                     "slug"=>"aphex-twin"}
   JSON.stub(:parse).and_return (artist_data)
  end

  let(:artist) { Mixcloud::Artist.new("http://www.mixcloud.com/artist/aphex-twin/?metadata=1")}

  describe "#turn_www_to_api" do
    it "should perform substitute www for api correctly" do
      artist.turn_www_to_api("http://www.mixcloud.com/").should eq "http://api.mixcloud.com/"
    end

    # it "should strip off leading and trailing whitesapces when necessary" do
    #   artist.turn_www_to_api("http://www.mixcloud.com/")
    # end
  end
end
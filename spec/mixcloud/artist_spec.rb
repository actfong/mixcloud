require 'mixcloud'

describe 'Mixcloud::Artist' do
  before do
    artist_data = {"name"=>"Aphex Twin",
                   "url"=>"http://www.mixcloud.com/artist/aphex-twin/",
                   "key"=>"/artist/aphex-twin/",
                   "type"=>"artist",
                   "slug"=>"aphex-twin"}
    JSON.stub(:parse).and_return (artist_data)
  end
                  
  let(:aphex) { Mixcloud::Artist.new('http://api.mixcloud.com/artist/aphex-twin/?metadata=1') }

  describe "#popular_url" do
    it "should find the the url of its most popular cloudcasts" do
      aphex.popular_url.should eql('http://api.mixcloud.com/artist/aphex-twin/popular/')
    end
  end

  describe '#hot_url' do
    it "should find the url of its hottest cloudcasts" do
      aphex.hot_url.should eql('http://api.mixcloud.com/artist/aphex-twin/hot/')
    end
  end

  describe '#new_url' do
    it "should find the url of its latest cloudcasts" do
      aphex.new_url.should eql('http://api.mixcloud.com/artist/aphex-twin/new/')
    end
  end
end
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

  it "should find the the url of its most popular cloudcasts" do
    aphex.popular_url.should eql('http://api.mixcloud.com/artist/aphex-twin/popular/')
  end

  it "should find the url of its hottest cloudcasts" do
    aphex.hot_url.should eql('http://api.mixcloud.com/artist/aphex-twin/hot/')
  end

  it "should find the url of its latest cloudcasts" do
    aphex.new_url.should eql('http://api.mixcloud.com/artist/aphex-twin/new/')
  end

  it "should respond to slug" do
    aphex.slug.should == "aphex-twin"
  end

  it "should respond to key" do
    aphex.key.should == '/artist/aphex-twin/'
  end

  it "should find Artist by slug" do
    Mixcloud::Artist.find_by_slug('aphex-twin').url.should eq "http://www.mixcloud.com/artist/aphex-twin/"
  end
end

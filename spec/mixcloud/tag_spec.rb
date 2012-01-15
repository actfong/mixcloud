require 'mixcloud'

describe "Mixcloud::Tag" do
  before do
    tag_data = {"url"=>"http://www.mixcloud.com/tag/funk/", 
                "type"=>"tag", 
                "name"=>"Funk",
                "key"=>"/tag/funk/",
                "metadata"=> {
                  "connections"=> {"popular"=>"http://api.mixcloud.com/tag/funk/popular/", 
                                   "new"=>"http://api.mixcloud.com/tag/funk/new/",
                                   "hot"=>"http://api.mixcloud.com/tag/funk/hot/"
                                  }
                             }
               }
    JSON.stub(:parse).and_return(tag_data)
  end

  let(:tag) { Mixcloud::Tag.new('http://api.mixcloud.com/tag/funk/?metadata=1') }
  
  describe "instances" do
    it "should not have an instance variable named @metadata" do
      tag.instance_variables.should_not include(:@metadata)
    end
  end

  describe "#popular_url" do
    it "should return the url for most popular cloudcasts containing this tag" do
      tag.popular_url.should eq "http://api.mixcloud.com/tag/funk/popular/"
    end
  end

  describe '#new_url' do
    it "should return the url for latest cloudcasts containing this tag" do
      tag.new_url.should eq "http://api.mixcloud.com/tag/funk/new/"
    end
  end

  describe '#hot_url' do
    it "should return the url for 'hottest' cloudcasts containing this tag" do
      tag.hot_url.should eq "http://api.mixcloud.com/tag/funk/hot/"
    end
  end

end
require 'mixcloud'

describe "Mixcloud::UrlFixer" do


  describe ".validate_mixcloud_url" do
    it "should raise an exception when a user provides an invalid URL to construct an object" do
      expect { Mixcloud::User.new('http://www.google.com') }.to raise_error ('You provided an invalid Mixcloud-API url. It must start with http://api.mixcloud.com/')
    end
    
    it "should not do anything if the url is valid" do
      user = Mixcloud::User.new('http://api.mixcloud.com/ctafong/')
      user.name.should eq 'ctafong'
    end
  end
  
  describe ".concat_with_metadata" do
    it "should not do anything with an url that ends with ?metadata=1" do
      url = 'http://api.mixcloud.com/ctafong/?metadata=1'
      new_url = Mixcloud::UrlFixer.concat_with_metadata(url)
      url.should eq url
    end
    
    it "should not do anything with an url that ends with ?metadata=1/" do
      url = 'http://api.mixcloud.com/ctafong/?metadata=1/'
      new_url = Mixcloud::UrlFixer.concat_with_metadata(url)
      url.should eq url
    end
    
    it "should append with a forward slash if the given url does not end with a forward slash" do
      url = 'http://api.mixcloud.com/ctafong'
      new_url = Mixcloud::UrlFixer.concat_with_metadata(url)
      new_url.should eq 'http://api.mixcloud.com/ctafong/?metadata=1'
    end
    
    it "should append with ?metadata=1 if it does not end with ?metadata=1" do
      url = 'http://api.mixcloud.com/ctafong/'
      new_url = Mixcloud::UrlFixer.concat_with_metadata(url)
      new_url.should eq 'http://api.mixcloud.com/ctafong/?metadata=1'
    end
  end

  describe ".turn_www_to_api" do
    it "should substitute www for api" do
      Mixcloud::UrlFixer.turn_www_to_api("http://www.mixcloud.com/").should eq "http://api.mixcloud.com/"
    end

    it "should strip off whitespaces when necessary" do
      Mixcloud::UrlFixer.turn_www_to_api("  http://www.mixcloud.com/   ").should eq "http://api.mixcloud.com/"
    end

  end
end
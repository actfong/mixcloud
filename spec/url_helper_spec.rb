require 'spec_helper'

describe "Mixcloud::UrlHelper" do
  before do
    FakeWeb.register_uri(:get, "http://api.mixcloud.com/spartacus/?metadata=1", 
                         :body => 'spec/json_responses/user_response.json', 
                         :content_type => "application/json")
    @user = Mixcloud::User.new('http://api.mixcloud.com/spartacus/')
  end
  
  describe ".validate_mixcloud_url" do
    it "should raise an exception when a user provides an invalid URL to construct an object" do
      # #validate_mixcloud_url is called once a subclass of Resource is instantiated
      expect { Mixcloud::User.new('http://www.google.com') }.to raise_error ('You provided an invalid Mixcloud-API url. It must start with http://api.mixcloud.com/')
    end
    
    it "should not do anything if the url is valid" do
      @user.name.should eq 'Spartacus'
    end
  end
  
  describe ".concat_with_metadata" do
    # Since Mixcloud::Resource includes the UrlHelper, its subclasses gets its methods as instance methods
    it "should not do anything with an url that ends with ?metadata=1" do
      url = 'http://api.mixcloud.com/ctafong/?metadata=1'
      new_url = @user.concat_with_metadata(url)
      url.should eq 'http://api.mixcloud.com/ctafong/?metadata=1'
    end

    it "should append with a forward slash if the given url does not end with a forward slash" do
      url = 'http://api.mixcloud.com/ctafong'
      new_url = @user.concat_with_metadata(url)
      new_url.should eq 'http://api.mixcloud.com/ctafong/?metadata=1'
    end
    
    it "should append with ?metadata=1 if it does not end with ?metadata=1" do
      url = 'http://api.mixcloud.com/ctafong/'
      new_url = @user.concat_with_metadata(url)
      new_url.should eq 'http://api.mixcloud.com/ctafong/?metadata=1'
    end
  end

  describe ".turn_www_to_api" do
    # since Mixcloud::Search extends the UrlHelper module, we can use its methods as class methods
    it "should substitute www for api" do
      Mixcloud::Search.turn_www_to_api("http://www.mixcloud.com/").should eq "http://api.mixcloud.com/"
    end

    it "should strip off whitespaces when necessary" do
      Mixcloud::Search.turn_www_to_api("  http://www.mixcloud.com/   ").should eq "http://api.mixcloud.com/"
    end
  end
end
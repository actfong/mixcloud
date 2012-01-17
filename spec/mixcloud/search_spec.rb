require 'mixcloud'

describe "Mixcloud::Search" do
  describe ".find_artist" do
    it "should return an array of Artist objects" do
      search_results = Mixcloud::Search.find_artist('dorian concept')
      search_results.class.should eq Array
      search_results.each { | result | result.class.should == Mixcloud::Artist }
    end
  end

  describe ".find_cloudcast" do
    it "should return an array of cloudcast objects" do
      search_results = Mixcloud::Search.find_cloudcast('cloudcast api test')
      search_results.class.should eq Array
      search_results.each { | result | result.class.should == Mixcloud::Cloudcast }
    end
  end

  describe ".find_user" do
    it "should return an array of user objects" do
      search_results = Mixcloud::Search.find_user('ctafong')
      search_results.class.should eq Array
      search_results.each { | result | result.class.should == Mixcloud::User }
    end
  end

  describe ".find_tag" do
    it "should return an array of tag objects" do
      search_results = Mixcloud::Search.find_tag('liquid funk')
      search_results.class.should eq Array
      search_results.each { | result | result.class.should == Mixcloud::Tag }
    end
  end
end
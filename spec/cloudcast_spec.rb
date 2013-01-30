require 'spec_helper'

describe "Mixcloud::Cloudcast" do

  before do
    FakeWeb.register_uri(:get, "http://api.mixcloud.com/spartacus/party-time/?metadata=1", 
                         :body => 'spec/json_responses/cloudcast_response.json', 
                         :content_type => "application/json")
    fakeweb_mixcloud_url('tag','funk', 'spec/json_responses/tag_funk_response.json')
    fakeweb_mixcloud_url('tag','funky-house', 'spec/json_responses/tag_funky_house_response.json')
  end

  let(:cloudcast) { Mixcloud::Cloudcast.new('http://api.mixcloud.com/spartacus/party-time/?metadata=1') }
  subject { cloudcast }
  
  describe "instances" do
    its(:instance_variables) { should_not include(:@metadata) }
    its(:instance_variables) { should_not include(:@pictures) }
    its(:instance_variables) { should_not include(:@type) }
    its(:instance_variables) { should_not include(:@sections) }
    its(:instance_variables) { should_not include(:@tags) }

    # public_url and api_url are set by #set_public_and_api_urls in Resource class
    its(:public_url) { should eq 'http://www.mixcloud.com/spartacus/party-time/' }
    its(:api_url) { should eq 'http://api.mixcloud.com/spartacus/party-time/?metadata=1' }

    # defined by an array in Mixcloud::Cloudcast
    its(:listeners_url) { should eq "http://api.mixcloud.com/spartacus/party-time/listeners/?metadata=1" }
    its(:similar_url) { should eq "http://api.mixcloud.com/spartacus/party-time/similar/?metadata=1" }
    its(:favorites_url) { should eq "http://api.mixcloud.com/spartacus/party-time/favorites/?metadata=1" }
    its(:comments_url) { should eq "http://api.mixcloud.com/spartacus/party-time/comments/?metadata=1"}

    # set by create_picture_url_methods in Resource
    its(:medium_picture_url) { should eq "http://images-mix.netdna-ssl.com/w/100/h/100/q/85/upload/images/extaudio/61a1279f-e3c0-4871-aa8e-c4cf5466edb8.png"}
    its(:extra_large_picture_url){ should eq "http://images-mix.netdna-ssl.com/w/600/h/600/q/85/upload/images/extaudio/61a1279f-e3c0-4871-aa8e-c4cf5466edb8.png" }
    its(:large_picture_url) { should eq 'http://images-mix.netdna-ssl.com/w/300/h/300/q/85/upload/images/extaudio/61a1279f-e3c0-4871-aa8e-c4cf5466edb8.png'}
    its(:medium_mobile_picture_url) { should eq "http://images-mix.netdna-ssl.com/w/80/h/80/q/75/upload/images/extaudio/61a1279f-e3c0-4871-aa8e-c4cf5466edb8.png" }
    its(:small_picture_url) { should eq "http://images-mix.netdna-ssl.com/w/25/h/25/q/85/upload/images/extaudio/61a1279f-e3c0-4871-aa8e-c4cf5466edb8.png"}
    its(:thumbnail_picture_url) { should eq "http://images-mix.netdna-ssl.com/w/50/h/50/q/85/upload/images/extaudio/61a1279f-e3c0-4871-aa8e-c4cf5466edb8.png" }
  end

  describe "#sections" do
    it "should return an array" do
      cloudcast.sections.class.should == Array
    end

    it "should contain 9 Section objects based on the test data" do
      cloudcast.sections.count.should == 9
      cloudcast.sections.each{ |section| section.should be_an_instance_of(Mixcloud::Section) }
    end

    it "should return Section objects with correct data" do
      cloudcast.sections[0].track_url.should eq 'http://api.mixcloud.com/track/jazztronik/samurai-12-mix/?metadata=1'
      cloudcast.sections[0].position.should eq 1
      cloudcast.sections[0].start_time.should eq 0
      cloudcast.sections[0].section_type.should eq 'track'
      
      cloudcast.sections[5].track_url.should eq 'http://api.mixcloud.com/track/michael-jackson/thrill-her/?metadata=1'
      cloudcast.sections[5].position.should eq 6
      cloudcast.sections[5].start_time.should eq 1763
      cloudcast.sections[5].section_type.should eq 'track'
    end
  end

  describe "#tags" do
    it "should return an array" do
      cloudcast.tags.class.should == Array
    end
    
    it "should contain 2 Tag objects based on the test data" do
      cloudcast.tags.count.should == 2
      cloudcast.tags.each{ |section| section.should be_an_instance_of(Mixcloud::Tag) }
    end
    
    it "should return Section objects with correct data" do
      cloudcast.tags[0].public_url.should eq "http://www.mixcloud.com/tag/funky-house/"
      cloudcast.tags[0].api_url.should eq "http://api.mixcloud.com/tag/funky-house/?metadata=1"
      cloudcast.tags[0].name.should eq "Funky house"
      cloudcast.tags[0].key.should eq "/tag/funky-house/"
    end
  end

  describe "#tag_urls" do
    it "should return an array" do
      cloudcast.tag_urls.class.should == Array
    end
    
    it "should return tag urls with the correct data" do
      cloudcast.tag_urls.should include("http://api.mixcloud.com/tag/funky-house/?metadata=1")
      cloudcast.tag_urls.should include("http://api.mixcloud.com/tag/funk/?metadata=1")
    end
  end
  
  describe "#convert_hash_data_into_array_of" do
    # In general private methods don't need to be tested, but I still want to see whether it will raise an error when needed
    it "should raise an error when invoked with the wrong argument type" do
      expect{cloudcast.send(:convert_hash_data_into_array_of, ('foobar'))}.to raise_error(Mixcloud::Error)
    end
  end
end
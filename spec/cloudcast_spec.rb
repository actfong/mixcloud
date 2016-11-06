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
    specify { expect(subject.instance_variables).not_to include(:@metadata) }
    specify { expect(subject.instance_variables).not_to include(:@pictures) }
    specify { expect(subject.instance_variables).not_to include(:@type) }
    specify { expect(subject.instance_variables).not_to include(:@sections) }
    specify { expect(subject.instance_variables).not_to include(:@tags) }

    # public_url and api_url are set by #set_public_and_api_urls in Resource class
    specify{ expect(subject.public_url).to eq 'http://www.mixcloud.com/spartacus/party-time/' }
    specify{ expect(subject.api_url).to eq 'http://api.mixcloud.com/spartacus/party-time/?metadata=1' }

    # defined by an array in Mixcloud::Cloudcast
    specify{ expect(subject.listeners_url).to eq "http://api.mixcloud.com/spartacus/party-time/listeners/?metadata=1" }
    specify{ expect(subject.similar_url).to eq "http://api.mixcloud.com/spartacus/party-time/similar/?metadata=1" }
    specify{ expect(subject.favorites_url).to eq "http://api.mixcloud.com/spartacus/party-time/favorites/?metadata=1" }
    specify{ expect(subject.comments_url).to eq "http://api.mixcloud.com/spartacus/party-time/comments/?metadata=1" }

    # set by create_picture_url_methods in Resource
    specify{ expect(subject.medium_picture_url).to eq "http://images-mix.netdna-ssl.com/w/100/h/100/q/85/upload/images/extaudio/61a1279f-e3c0-4871-aa8e-c4cf5466edb8.png" }
    specify{ expect(subject.extra_large_picture_url).to eq "http://images-mix.netdna-ssl.com/w/600/h/600/q/85/upload/images/extaudio/61a1279f-e3c0-4871-aa8e-c4cf5466edb8.png" }
    specify{ expect(subject.large_picture_url).to eq 'http://images-mix.netdna-ssl.com/w/300/h/300/q/85/upload/images/extaudio/61a1279f-e3c0-4871-aa8e-c4cf5466edb8.png' }
    specify{ expect(subject.medium_mobile_picture_url).to eq "http://images-mix.netdna-ssl.com/w/80/h/80/q/75/upload/images/extaudio/61a1279f-e3c0-4871-aa8e-c4cf5466edb8.png" }
    specify{ expect(subject.small_picture_url).to eq "http://images-mix.netdna-ssl.com/w/25/h/25/q/85/upload/images/extaudio/61a1279f-e3c0-4871-aa8e-c4cf5466edb8.png" }
    specify{ expect(subject.thumbnail_picture_url).to eq "http://images-mix.netdna-ssl.com/w/50/h/50/q/85/upload/images/extaudio/61a1279f-e3c0-4871-aa8e-c4cf5466edb8.png" }
  end

  describe "#sections" do
    specify { expect(cloudcast.sections).to be_a Array }

    it "contains 9 Section objects based on the test data" do
      expect(cloudcast.sections.count).to eq 9
    end

    it "returns Section objects with correct data" do
      expect(cloudcast.sections[0]).to be_a(Mixcloud::Section)
      expect(cloudcast.sections[0].track_url).to eq 'http://api.mixcloud.com/track/jazztronik/samurai-12-mix/?metadata=1'
      expect(cloudcast.sections[0].position).to eq 1
      expect(cloudcast.sections[0].start_time).to eq 0
      expect(cloudcast.sections[0].section_type).to eq 'track'
    end
  end

  describe "#tags" do
    specify { expect(cloudcast.tags).to be_a Array }

    it "contains 2 Tag objects based on the test data" do
      expect(cloudcast.tags.count).to eq 2
    end

    it "returns Tag objects with correct data" do
      expect(cloudcast.tags[0]).to be_a(Mixcloud::Tag)
      expect(cloudcast.tags[0].public_url).to eq "http://www.mixcloud.com/tag/funky-house/"
      expect(cloudcast.tags[0].api_url).to eq "http://api.mixcloud.com/tag/funky-house/?metadata=1"
      expect(cloudcast.tags[0].name).to eq "Funky house"
      expect(cloudcast.tags[0].key).to eq "/tag/funky-house/"
    end
  end


  describe "#tag_urls" do
    specify { expect(cloudcast.tag_urls).to be_a Array }

    it "returns tag_urls with the correct data" do
      expect(cloudcast.tag_urls).to include("http://api.mixcloud.com/tag/funky-house/?metadata=1")
      expect(cloudcast.tag_urls).to include("http://api.mixcloud.com/tag/funk/?metadata=1")
    end
  end

  describe "#convert_hash_data_into_array_of" do
    # In general private methods don't need to be tested, but I still want to see whether it will raise an error when needed
    specify do
      expect{cloudcast.send(:convert_hash_data_into_array_of, ('foobar'))}.to raise_error(Mixcloud::Error)
    end
  end
end

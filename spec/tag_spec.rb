require 'spec_helper'

describe "Mixcloud::Tag" do
  before do
    fakeweb_mixcloud_url('tag','funk', 'spec/json_responses/tag_funk_response.json')
  end

  let(:tag) { Mixcloud::Tag.new('http://api.mixcloud.com/tag/funk/?metadata=1') }
  subject { tag }

  its(:instance_variables) { should_not include(:@metadata) }
  its(:instance_variables) { should_not include(:@type) }

  # public_url and api_url are set by #set_public_and_api_urls in Resource class
  its(:public_url) { should eq 'http://www.mixcloud.com/tag/funk/' }
  its(:api_url) { should eq 'http://api.mixcloud.com/tag/funk/?metadata=1' }

  # instance methods provided by the PopularNewHot module
  its(:popular_url) { should eq "http://api.mixcloud.com/tag/funk/popular/" }
  its(:new_url) { should eq "http://api.mixcloud.com/tag/funk/new/" }
  its(:hot_url) { should eq "http://api.mixcloud.com/tag/funk/hot/" }
end
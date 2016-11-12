require 'spec_helper'

describe 'Mixcloud::Tag' do
  before do
    fakeweb_mixcloud_url('tag','funk', 'spec/json_responses/tag_funk_response.json')
  end

  subject { Mixcloud::Tag.new("http://api.mixcloud.com/tag/#{tag}/?metadata=1") }
  let(:tag) { 'funk' }

  specify { expect(subject.instance_variables).not_to include(:@metadata) }
  specify { expect(subject.instance_variables).not_to include(:@type) }

  # public_url and api_url are set by #set_public_and_api_urls in Resource class
  specify { expect(subject.public_url).to eq 'http://www.mixcloud.com/tag/funk/' }
  specify { expect(subject.api_url).to eq 'http://api.mixcloud.com/tag/funk/?metadata=1' }

  # instance methods provided by the PopularNewHot module
  specify { expect(subject.popular_url).to eq 'http://api.mixcloud.com/tag/funk/popular/' }
  specify { expect(subject.new_url).to eq 'http://api.mixcloud.com/tag/funk/new/' }
  specify { expect(subject.hot_url).to eq 'http://api.mixcloud.com/tag/funk/hot/' }
end

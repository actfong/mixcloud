require 'spec_helper'

describe 'Mixcloud::Artist' do
  before do
    fakeweb_mixcloud_url('artist','aphex-twin', 'spec/json_responses/artist_response.json')
  end

  let(:artist) { Mixcloud::Artist.new('http://api.mixcloud.com/artist/aphex-twin/?metadata=1') }
  subject { artist }

  # these data should have been filtered out by the resource class
  specify { expect(subject.instance_variables).not_to include(:@metadata) }
  specify { expect(subject.instance_variables).not_to include(:@type) }

  specify { expect(subject.name).to eq 'Aphex Twin' }
  specify { expect(subject.key).to eq '/artist/aphex-twin/' }
  specify { expect(subject.slug).to eq 'aphex-twin' }

  # # public_url and api_url are set by #set_public_and_api_urls in Resource class
  specify { expect(subject.public_url).to eq 'http://www.mixcloud.com/artist/aphex-twin/'  }
  specify { expect(subject.api_url).to eq 'http://api.mixcloud.com/artist/aphex-twin/?metadata=1'  }

  # # instance methods provided by the PopularNewHot module
  specify{ expect(subject.popular_url).to eq 'http://api.mixcloud.com/artist/aphex-twin/popular/' }
  specify{ expect(subject.new_url).to eq 'http://api.mixcloud.com/artist/aphex-twin/new/' }
  specify{ expect(subject.hot_url).to eq 'http://api.mixcloud.com/artist/aphex-twin/hot/' }

  # context "Initiated with a URL of another resource type"
  it 'raises a Mixcloud::Error' do
    FakeWeb.register_uri(:get, 'http://api.mixcloud.com/spartacus/?metadata=1',
                         :body => 'spec/json_responses/user_response.json',
                         :content_type => 'application/json')
    expect {
      Mixcloud::Artist.new('http://api.mixcloud.com/spartacus/?metadata=1')
    }.to raise_error(Mixcloud::Error)
  end
end

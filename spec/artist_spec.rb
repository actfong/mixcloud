require 'spec_helper'

describe 'Mixcloud::Artist' do
  before do
    fakeweb_mixcloud_url('artist','aphex-twin', 'spec/json_responses/artist_response.json')
  end

  let(:artist) { Mixcloud::Artist.new('http://api.mixcloud.com/artist/aphex-twin/?metadata=1') }
  subject { artist }

  # these data should have been filtered out by the resource class
  its(:instance_variables) { should_not include(:@metadata) }
  its(:instance_variables) { should_not include(:@type) }

  its(:name){ should eq 'Aphex Twin' }
  its(:key){ should eq '/artist/aphex-twin/' }
  its(:slug){ should eq 'aphex-twin' }

  # public_url and api_url are set by #set_public_and_api_urls in Resource class
  its(:public_url){ should eq "http://www.mixcloud.com/artist/aphex-twin/" }
  its(:api_url){ should eq "http://api.mixcloud.com/artist/aphex-twin/?metadata=1" }

  # instance methods provided by the PopularNewHot module
  its(:popular_url){ should eq 'http://api.mixcloud.com/artist/aphex-twin/popular/' }
  its(:new_url){ should eq 'http://api.mixcloud.com/artist/aphex-twin/new/' }
  its(:hot_url){ should eq 'http://api.mixcloud.com/artist/aphex-twin/hot/' }

end

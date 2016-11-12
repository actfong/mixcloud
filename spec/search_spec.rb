require 'spec_helper'
require 'fakeweb'

describe 'Mixcloud::Search' do

  describe '.find_artist' do
    before do
      fakeweb_mixcloud_search_url('aphex+twin', 'artist', 'spec/json_responses/search_artists.json')
      fakeweb_mixcloud_url('artist','aphex-twin', 'spec/json_responses/artist_response.json')
      fakeweb_mixcloud_url('artist','the-aphex-twin', 'spec/json_responses/artist_response.json')
    end

    subject { Mixcloud::Search.find_artist(artist) }
    let(:artist) { 'aphex twin' }
    specify { expect(subject).to be_a Array }
    specify { expect(subject.count).to eq 2 }
    specify { expect(subject[0]).to be_a Mixcloud::Artist }

  end

  describe '.find_cloudcast' do
    before do
      fakeweb_mixcloud_search_url('party+time', 'cloudcast', 'spec/json_responses/search_cloudcasts.json')
      # intercept the http-calls made by Cloudcast.new (twice, once for each search result)
      FakeWeb.register_uri(:get, 'http://api.mixcloud.com/channel4/house-party-nye-2012-norman-jay-channel-4/?metadata=1',
                           :body => 'spec/json_responses/cloudcast_response.json',
                           :content_type => 'application/json')
      FakeWeb.register_uri(:get, 'http://api.mixcloud.com/spartacus/party-time/?metadata=1',
                          :body => 'spec/json_responses/cloudcast_response.json',
                          :content_type => 'application/json')
    end

    subject { Mixcloud::Search.find_cloudcast(cloudcast) }
    let(:cloudcast) { 'party time' }
    specify { expect(subject).to be_a Array }
    specify { expect(subject.count).to eq 2 }
    specify { expect(subject[0]).to be_a Mixcloud::Cloudcast }
  end

  describe '.find_user' do
    before do
      fakeweb_mixcloud_search_url('spartacus', 'user', 'spec/json_responses/search_users.json')
      # intercept the http-calls made by User.new (twice, once for each search result)
      FakeWeb.register_uri(:get, 'http://api.mixcloud.com/spartacus/?metadata=1',
                           :body => 'spec/json_responses/user_response.json',
                           :content_type => 'application/json')
      FakeWeb.register_uri(:get, 'http://api.mixcloud.com/yassspartacus/?metadata=1',
                          :body => 'spec/json_responses/user_response.json',
                          :content_type => 'application/json')
    end

    subject { Mixcloud::Search.find_user('spartacus') }
    specify { expect(subject).to be_a Array }
    specify { expect(subject.count).to eq 2 }
    specify { expect(subject[0]).to be_a Mixcloud::User }
  end

  describe '.find_tag' do
    before do
      fakeweb_mixcloud_search_url('liquid+funk', 'tag', 'spec/json_responses/search_tags.json')
      # intercept the http-calls made by Tag.new (twice, once for each search result)
      fakeweb_mixcloud_url('tag','liquid-funk', 'spec/json_responses/tag_liquid_funk_response.json')
      fakeweb_mixcloud_url('tag','dnb-hospital-drum-and-bass-liquid-funk', 'spec/json_responses/tag_dnb_hospital_response.json')
    end
    subject { Mixcloud::Search.find_tag('liquid funk') }
    specify { expect(subject).to be_a Array }
    specify { expect(subject.count).to eq 2 }
    specify { expect(subject[0]).to be_a Mixcloud::Tag }
  end
end

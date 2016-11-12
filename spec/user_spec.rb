require 'spec_helper'

describe 'Mixcloud::User' do
  before do
    FakeWeb.register_uri(:get, 'http://api.mixcloud.com/spartacus/?metadata=1',
                         :body => 'spec/json_responses/user_response.json',
                         :content_type => 'application/json')
  end

  subject{ Mixcloud::User.new("http://api.mixcloud.com/#{user}/") }
  let(:user) { 'spartacus' }

  specify { expect(subject.instance_variables).not_to include(:@metadata) }
  specify { expect(subject.instance_variables).not_to include(:@pictures) }
  specify { expect(subject.instance_variables).not_to include(:@type) }

  # public_url and api_url are set by #set_public_and_api_urls in Resource class
  specify { expect(subject.public_url).to eq 'http://www.mixcloud.com/spartacus/' }
  specify { expect(subject.api_url).to eq 'http://api.mixcloud.com/spartacus/?metadata=1' }

  # defined by an array in Mixcloud::User
  specify { expect(subject.feed_url).to eq 'http://api.mixcloud.com/spartacus/feed/' }
  specify { expect(subject.playlists_url).to eq 'http://api.mixcloud.com/spartacus/playlists/' }
  specify { expect(subject.comments_url).to eq 'http://api.mixcloud.com/spartacus/comments/' }
  specify { expect(subject.followers_url).to eq 'http://api.mixcloud.com/spartacus/followers/' }
  specify { expect(subject.favorites_url).to eq 'http://api.mixcloud.com/spartacus/favorites/' }
  specify { expect(subject.following_url).to eq 'http://api.mixcloud.com/spartacus/following/' }
  specify { expect(subject.cloudcasts_url).to eq 'http://api.mixcloud.com/spartacus/cloudcasts/' }
  specify { expect(subject.listens_url).to eq 'http://api.mixcloud.com/spartacus/listens/' }

  # set by create_picture_url_methods in Resource
  specify { expect(subject.medium_picture_url).to eq 'http://images-mix.netdna-ssl.com/w/100/h/100/q/85/upload/images/profile/428814af-9313-4e8e-94c9-fe77db0397ec.jpg' }
  specify { expect(subject.extra_large_picture_url).to eq 'http://images-mix.netdna-ssl.com/w/600/h/600/q/85/upload/images/profile/428814af-9313-4e8e-94c9-fe77db0397ec.jpg' }
  specify { expect(subject.large_picture_url).to eq 'http://images-mix.netdna-ssl.com/w/300/h/300/q/85/upload/images/profile/428814af-9313-4e8e-94c9-fe77db0397ec.jpg' }
  specify { expect(subject.medium_mobile_picture_url).to eq 'http://images-mix.netdna-ssl.com/w/80/h/80/q/75/upload/images/profile/428814af-9313-4e8e-94c9-fe77db0397ec.jpg' }
  specify { expect(subject.small_picture_url).to eq 'http://images-mix.netdna-ssl.com/w/25/h/25/q/85/upload/images/profile/428814af-9313-4e8e-94c9-fe77db0397ec.jpg' }
  specify { expect(subject.thumbnail_picture_url).to eq 'http://images-mix.netdna-ssl.com/w/50/h/50/q/85/upload/images/profile/428814af-9313-4e8e-94c9-fe77db0397ec.jpg' }
end

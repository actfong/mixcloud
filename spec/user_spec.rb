require 'spec_helper'

describe "Mixcloud::User" do
  before do
    FakeWeb.register_uri(:get, "http://api.mixcloud.com/spartacus/?metadata=1", 
                         :body => 'spec/json_responses/user_response.json', 
                         :content_type => "application/json")
  end

  let(:user) { Mixcloud::User.new("http://api.mixcloud.com/spartacus/")}
  subject{ user }

  its(:instance_variables) { should_not include(:@metadata) }
  its(:instance_variables) { should_not include(:@pictures) }
  its(:instance_variables) { should_not include(:@type) }

  # public_url and api_url are set by #set_public_and_api_urls in Resource class
  its(:public_url) { should eq 'http://www.mixcloud.com/spartacus/' }
  its(:api_url) { should eq 'http://api.mixcloud.com/spartacus/?metadata=1' }

  # defined by an array in Mixcloud::User
  its(:feed_url) { should eq 'http://api.mixcloud.com/spartacus/feed/' }
  its(:playlists_url) { should eq 'http://api.mixcloud.com/spartacus/playlists/' }
  its(:comments_url) { should eq "http://api.mixcloud.com/spartacus/comments/" } 
  its(:followers_url) { should eq "http://api.mixcloud.com/spartacus/followers/" }
  its(:favorites_url) { should eq "http://api.mixcloud.com/spartacus/favorites/" }
  its(:following_url) { should eq "http://api.mixcloud.com/spartacus/following/" }
  its(:cloudcasts_url) { should eq "http://api.mixcloud.com/spartacus/cloudcasts/" }
  its(:listens_url) { should eq "http://api.mixcloud.com/spartacus/listens/" }

  # set by create_picture_url_methods in Resource
  its(:medium_picture_url) {should eq "http://images-mix.netdna-ssl.com/w/100/h/100/q/85/upload/images/profile/428814af-9313-4e8e-94c9-fe77db0397ec.jpg" }
  its(:extra_large_picture_url) { should eq "http://images-mix.netdna-ssl.com/w/600/h/600/q/85/upload/images/profile/428814af-9313-4e8e-94c9-fe77db0397ec.jpg" }
  its(:large_picture_url) { should eq "http://images-mix.netdna-ssl.com/w/300/h/300/q/85/upload/images/profile/428814af-9313-4e8e-94c9-fe77db0397ec.jpg" }
  its(:medium_mobile_picture_url) { should eq "http://images-mix.netdna-ssl.com/w/80/h/80/q/75/upload/images/profile/428814af-9313-4e8e-94c9-fe77db0397ec.jpg" }
  its(:small_picture_url) { should eq 'http://images-mix.netdna-ssl.com/w/25/h/25/q/85/upload/images/profile/428814af-9313-4e8e-94c9-fe77db0397ec.jpg' }
  its(:thumbnail_picture_url) { should eq 'http://images-mix.netdna-ssl.com/w/50/h/50/q/85/upload/images/profile/428814af-9313-4e8e-94c9-fe77db0397ec.jpg' }
end

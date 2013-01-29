require 'spec_helper'

describe "Mixcloud::Category" do

  before do
    fakeweb_mixcloud_url('categories','ambient', 'spec/json_responses/category_response.json')
  end

  let(:category) { Mixcloud::Category.new('http://api.mixcloud.com/categories/ambient/?metadata=1') }
  subject { category }
  
  # these data should have been filtered out by the resource class
  its(:instance_variables) { should_not include(:@metadata) }
  its(:instance_variables) { should_not include(:@pictures) }
  its(:instance_variables) { should_not include(:@type) }

  its(:name) { should eq "Ambient" }
  its(:format) { should eq "music" }
  its(:key) { should eq "/categories/ambient/" }
  its(:slug) { should eq "ambient" }

  # public_url and api_url are set by #set_public_and_api_urls in Resource class
  its(:public_url) { should eq 'http://www.mixcloud.com/categories/ambient/' }
  its(:api_url) { should eq 'http://api.mixcloud.com/categories/ambient/?metadata=1' }

  # defined by an array in Mixcloud::Category
  its(:userpick_users_url) { should eq 'http://api.mixcloud.com/categories/ambient/userpick-users/' }
  its(:userpick_cloudcasts_url) { should eq 'http://api.mixcloud.com/categories/ambient/userpick-cloudcasts/' }
  its(:users_url) { should eq 'http://api.mixcloud.com/categories/ambient/users/' }
  its(:cloudcasts_url) { should eq 'http://api.mixcloud.com/categories/ambient/cloudcasts/' }

  # set by create_picture_url_methods in Resource
  its(:small_picture_url) { should eq 'http://images-mix.netdna-ssl.com/w/25/h/25/q/85/upload/images/profile/123e1fa9-396c-48e1-8121-96162008e060.jpg' }
  its(:large_picture_url) { should eq 'http://images-mix.netdna-ssl.com/w/300/h/300/q/85/upload/images/profile/123e1fa9-396c-48e1-8121-96162008e060.jpg' }
  its(:medium_picture_url) { should eq 'http://images-mix.netdna-ssl.com/w/100/h/100/q/85/upload/images/profile/123e1fa9-396c-48e1-8121-96162008e060.jpg' }
  its(:thumbnail_picture_url) { should eq 'http://images-mix.netdna-ssl.com/w/50/h/50/q/85/upload/images/profile/123e1fa9-396c-48e1-8121-96162008e060.jpg' }
  its(:medium_mobile_picture_url) { should eq 'http://images-mix.netdna-ssl.com/w/80/h/80/q/75/upload/images/profile/123e1fa9-396c-48e1-8121-96162008e060.jpg' }
end
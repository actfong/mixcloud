require 'spec_helper'

describe "Mixcloud::Category" do

  before do
    fakeweb_mixcloud_url('categories','ambient', 'spec/json_responses/category_response.json')
  end

  let(:category) { Mixcloud::Category.new('http://api.mixcloud.com/categories/ambient/?metadata=1') }
  subject { category }
  
  # these data should have been filtered out by the resource class
  specify { expect(subject.instance_variables).not_to include(:@metadata) }
  specify { expect(subject.instance_variables).not_to include(:@pictures) }
  specify { expect(subject.instance_variables).not_to include(:@type) }

  specify { expect(subject.name).to eq "Ambient" }
  specify { expect(subject.format).to eq "music" }
  specify { expect(subject.key).to eq "/categories/ambient/" }
  specify { expect(subject.slug).to eq "ambient" }

  # public_url and api_url are set by #set_public_and_api_urls in Resource class
  specify { expect(subject.public_url).to eq 'http://www.mixcloud.com/categories/ambient/' }
  specify { expect(subject.api_url).to eq 'http://api.mixcloud.com/categories/ambient/?metadata=1' }

  # defined by an array in Mixcloud::Category
  specify{ expect(subject.userpick_users_url).to eq 'http://api.mixcloud.com/categories/ambient/userpick-users/' }
  specify{ expect(subject.userpick_cloudcasts_url).to eq 'http://api.mixcloud.com/categories/ambient/userpick-cloudcasts/' }
  specify{ expect(subject.users_url).to eq 'http://api.mixcloud.com/categories/ambient/users/' }
  specify{ expect(subject.cloudcasts_url).to eq 'http://api.mixcloud.com/categories/ambient/cloudcasts/' }

  # set by create_picture_url_methods in Resource
  specify{ expect(subject.small_picture_url).to eq 'http://images-mix.netdna-ssl.com/w/25/h/25/q/85/upload/images/profile/123e1fa9-396c-48e1-8121-96162008e060.jpg' }
  specify{ expect(subject.large_picture_url).to eq 'http://images-mix.netdna-ssl.com/w/300/h/300/q/85/upload/images/profile/123e1fa9-396c-48e1-8121-96162008e060.jpg' }
  specify{ expect(subject.medium_picture_url).to eq 'http://images-mix.netdna-ssl.com/w/100/h/100/q/85/upload/images/profile/123e1fa9-396c-48e1-8121-96162008e060.jpg' }
  specify{ expect(subject.thumbnail_picture_url).to eq 'http://images-mix.netdna-ssl.com/w/50/h/50/q/85/upload/images/profile/123e1fa9-396c-48e1-8121-96162008e060.jpg' }
  specify{ expect(subject.medium_mobile_picture_url).to eq 'http://images-mix.netdna-ssl.com/w/80/h/80/q/75/upload/images/profile/123e1fa9-396c-48e1-8121-96162008e060.jpg' }
end
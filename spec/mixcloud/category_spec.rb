require 'mixcloud'

describe "Mixcloud::Category" do

  before do
    category_data = {"name"=>"Ambient", 
                     "format"=>"music", 
                     "url"=>"http://www.mixcloud.com/categories/ambient/",
                     "pictures"=> {"small"=>"http://tb1.mixcloud.com/w/25/h/25/q/85/upload/images/profile/bdeec47d-5e24-4f26-9151-b24210409543.jpg", 
                                   "large"=>"http://tb1.mixcloud.com/w/300/h/300/q/85/upload/images/profile/bdeec47d-5e24-4f26-9151-b24210409543.jpg", 
                                   "medium"=>"http://tb1.mixcloud.com/w/150/h/150/q/85/upload/images/profile/bdeec47d-5e24-4f26-9151-b24210409543.jpg", 
                                   "thumbnail"=>"http://tb1.mixcloud.com/w/50/h/50/q/85/upload/images/profile/bdeec47d-5e24-4f26-9151-b24210409543.jpg", 
                                   "medium_mobile"=>"http://tb1.mixcloud.com/w/80/h/80/q/75/upload/images/profile/bdeec47d-5e24-4f26-9151-b24210409543.jpg"}, 
                     "key"=>"/categories/ambient/", 
                     "type"=>"category", 
                     "slug"=>"ambient", 
                     "metadata"=> {"connections"=>{
                                   "userpick-users"=>"http://api.mixcloud.com/categories/ambient/userpick-users/", 
                                   "userpick-cloudcasts"=>"http://api.mixcloud.com/categories/ambient/userpick-cloudcasts/",
                                   "cloudcasts"=>"http://api.mixcloud.com/categories/ambient/cloudcasts/", 
                                   "users"=>"http://api.mixcloud.com/categories/ambient/users/"}
                                  }
                    }
    JSON.stub(:parse).and_return(category_data)
  end
                      
  let(:category) { Mixcloud::Category.new('http://api.mixcloud.com/categories/ambient/?=metadata=1') }

  describe "instances" do
    it "instances should not have an instance variable named @metadata" do
      category.instance_variables.should_not include(:@metadata)
    end

    it "instances should not have an instance variable named @pictures" do
      category.instance_variables.should_not include(:@pictures)
    end
  end
  
  describe "#userpick_users_url" do
    it "should return the url for userpick_users" do
      category.userpick_users_url.should eq 'http://api.mixcloud.com/categories/ambient/userpick-users/'
    end
  end

  describe "#userpick_cloudcasts_url" do
    it "should return the url for userpick_cloudcasts" do
      category.userpick_cloudcasts_url.should eq 'http://api.mixcloud.com/categories/ambient/userpick-cloudcasts/'
    end
  end

  describe "#users_url" do
    it "should return the url for users" do
      category.users_url.should eq 'http://api.mixcloud.com/categories/ambient/users/'
    end
  end

  describe "#cloudcasts_url" do
    it "should return the url for cloudcasts" do
      category.cloudcasts_url.should eq 'http://api.mixcloud.com/categories/ambient/cloudcasts/'
    end
  end

  describe "#small_picture_url" do
    it "should return the url for small_picture" do
      category.small_picture_url.should eq 'http://tb1.mixcloud.com/w/25/h/25/q/85/upload/images/profile/bdeec47d-5e24-4f26-9151-b24210409543.jpg'
    end
  end

  describe "#large_picture_url" do
    it "should return the url for large_picture" do
      category.large_picture_url.should eq 'http://tb1.mixcloud.com/w/300/h/300/q/85/upload/images/profile/bdeec47d-5e24-4f26-9151-b24210409543.jpg'
    end
  end

  describe "#medium_picture_url" do
    it "should return the url for medium_picture" do
      category.medium_picture_url.should eq 'http://tb1.mixcloud.com/w/150/h/150/q/85/upload/images/profile/bdeec47d-5e24-4f26-9151-b24210409543.jpg'
    end
  end

  describe "#thumbnail_picture_url" do
    it "should return the url for thumbnail_picture_url" do
      category.thumbnail_picture_url.should eq 'http://tb1.mixcloud.com/w/50/h/50/q/85/upload/images/profile/bdeec47d-5e24-4f26-9151-b24210409543.jpg'
    end
  end

  describe "#medium_mobile_picture_url" do
    it "should return the url for medium_mobile_picture_url" do
      category.medium_mobile_picture_url.should eq 'http://tb1.mixcloud.com/w/80/h/80/q/75/upload/images/profile/bdeec47d-5e24-4f26-9151-b24210409543.jpg'
    end
  end
  
end
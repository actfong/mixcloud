require 'mixcloud'

describe "Mixcloud::User" do
  before do
    user_data = { "username"=>"ctafong", 
                  "city"=>"Amsterdam",
                  "cloudcast_count"=>2,
                  "following_count"=>2,
                  "url"=>"http://www.mixcloud.com/ctafong/",
                  "pictures"=>  {"medium"=>"http://tb2.mixcloud.com/w/150/h/150/q/85/upload/images/profile/f12cbfbd-49be-45b8-bde2-6d1f49e443e2.jpg",
                                 "extra_large"=>"http://tb2.mixcloud.com/w/600/h/600/q/85/upload/images/profile/f12cbfbd-49be-45b8-bde2-6d1f49e443e2.jpg", 
                                 "large"=>"http://tb2.mixcloud.com/w/300/h/300/q/85/upload/images/profile/f12cbfbd-49be-45b8-bde2-6d1f49e443e2.jpg", 
                                 "medium_mobile"=>"http://tb2.mixcloud.com/w/80/h/80/q/75/upload/images/profile/f12cbfbd-49be-45b8-bde2-6d1f49e443e2.jpg",
                                 "small"=>"http://tb2.mixcloud.com/w/25/h/25/q/85/upload/images/profile/f12cbfbd-49be-45b8-bde2-6d1f49e443e2.jpg",
                                 "thumbnail"=>"http://tb2.mixcloud.com/w/50/h/50/q/85/upload/images/profile/f12cbfbd-49be-45b8-bde2-6d1f49e443e2.jpg"},
                  "listen_count"=>4,
                  "updated_time"=>"2012-01-14T15:31:17Z",
                  "created_time"=>"2012-01-10T01:38:20Z", 
                  "biog"=>"I listen to music while writing Ruby code",
                  "key"=>"/ctafong/", 
                  "country"=>"Netherlands", 
                  "follower_count"=>0, 
                  "metadata"=> { "connections"=>{"feed"=>"http://api.mixcloud.com/ctafong/feed/",
                                 "playlists"=>"http://api.mixcloud.com/ctafong/playlists/",
                                 "comments"=>"http://api.mixcloud.com/ctafong/comments/",
                                 "followers"=>"http://api.mixcloud.com/ctafong/followers/",
                                 "favorites"=>"http://api.mixcloud.com/ctafong/favorites/", 
                                 "following"=>"http://api.mixcloud.com/ctafong/following/", 
                                 "cloudcasts"=>"http://api.mixcloud.com/ctafong/cloudcasts/", 
                                 "listens"=>"http://api.mixcloud.com/ctafong/listens/"}}, 
                  "type"=>"user", 
                  "favorite_count"=>1, 
                  "name"=>"ctafong"} 
    JSON.stub(:parse).and_return(user_data)
  end

  let(:user) { Mixcloud::User.new("http://www.mixcloud.com/ctafong/")}

  describe "instances" do
    it "should not have an instance variable named @metadata" do
      user.instance_variables.should_not include(:@metadata)
    end

    it "should not have an instance variable named @pictures" do
      user.instance_variables.should_not include(:@pictures)
    end
  end

  describe "#feed_url" do
    it "should return the URL for the user's activities" do
      user.feed_url.should eq 'http://api.mixcloud.com/ctafong/feed/'
    end
  end

  describe "#playlists_url" do
    it "should return the URL of user's playlists" do
      user.playlists_url.should eq 'http://api.mixcloud.com/ctafong/playlists/'
    end
  end

  describe "#comments_url" do
    it "should return the URL of comments on user's profile" do
      user.comments_url.should eq "http://api.mixcloud.com/ctafong/comments/"
    end
  end

  describe "#followers_url" do
    it "should return the URL of user's followers" do
      user.followers_url.should eq "http://api.mixcloud.com/ctafong/followers/"
    end
  end

  describe "#favorites_url" do
    it "should return the URL of user's favorites" do
      user.favorites_url.should eq "http://api.mixcloud.com/ctafong/favorites/"
    end
  end

  describe "#following_url" do
    it "should return the URL of user's followings" do
      user.following_url.should eq "http://api.mixcloud.com/ctafong/following/"
    end
  end

  describe "#cloudcasts_url" do
    it "should return the URL of user's cloudcasts" do
      user.cloudcasts_url.should eq "http://api.mixcloud.com/ctafong/cloudcasts/"
    end
  end

  describe "#listens_url" do
    it "should return the URL of cloudcasts the user has listened to" do
      user.listens_url.should eq "http://api.mixcloud.com/ctafong/listens/"
    end
  end

  describe '#medium_picture_url' do
    it "should return the URL for its small picture" do
      user.medium_picture_url.should eq 'http://tb2.mixcloud.com/w/150/h/150/q/85/upload/images/profile/f12cbfbd-49be-45b8-bde2-6d1f49e443e2.jpg'
    end
  end

  describe '#extra_large_picture_url' do
    it "should return the URL for its extra large picture" do
      user.extra_large_picture_url.should eq 'http://tb2.mixcloud.com/w/600/h/600/q/85/upload/images/profile/f12cbfbd-49be-45b8-bde2-6d1f49e443e2.jpg'
    end
  end
  
  describe '#large_picture_url' do
    it "should return the URL for its large picture" do
      user.large_picture_url.should eq 'http://tb2.mixcloud.com/w/300/h/300/q/85/upload/images/profile/f12cbfbd-49be-45b8-bde2-6d1f49e443e2.jpg'
    end
  end
  describe '#medium_mobile_picture_url' do
    it "should return the URL for its medium mobile picture" do
      user.medium_mobile_picture_url.should eq 'http://tb2.mixcloud.com/w/80/h/80/q/75/upload/images/profile/f12cbfbd-49be-45b8-bde2-6d1f49e443e2.jpg'
    end
  end

  describe '#small_picture_url' do
    it "should return the URL for its small picture" do
      user.small_picture_url.should eq 'http://tb2.mixcloud.com/w/25/h/25/q/85/upload/images/profile/f12cbfbd-49be-45b8-bde2-6d1f49e443e2.jpg'
    end
  end
  
  describe '#thumbnail_picture_url' do
    it "should return the URL for its thumbnail picture" do
      user.thumbnail_picture_url.should eq 'http://tb2.mixcloud.com/w/50/h/50/q/85/upload/images/profile/f12cbfbd-49be-45b8-bde2-6d1f49e443e2.jpg'
    end
  end

end

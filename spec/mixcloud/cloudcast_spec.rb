require 'mixcloud'

describe "Mixcloud::Cloudcast" do

  before(:all) do
    #      test_data = {"sections"=>[{"track"=>{"name"=>"Magic Hour", 
    #                                           "artist"=>{"url"=>"http://www.mixcloud.com/artist/makoto/", "type"=>"artist", "name"=>"Makoto", "key"=>"/artist/makoto/", "slug"=>"makoto"}, 
    #                                           "url"=>"http://www.mixcloud.com/track/makoto/magic-hour/", 
    #                                           "key"=>"/track/makoto/magic-hour/", 
    #                                           "type"=>"track", 
    #                                           "slug"=>"magic-hour"}, 
    #                                "position"=>1, "start_time"=>0, "section_type"=>"track", "type"=>"section"},
    #                                {"track"=>{"name"=>"Alter-Ego-Tate",
    #                                           "artist"=>{"url"=>"http://www.mixcloud.com/artist/the-colonious/", "type"=>"artist", "name"=>"The Colonious", "key"=>"/artist/the-colonious/", "slug"=>"the-colonious"}, 
    #                                           "url"=>"http://www.mixcloud.com/track/the-colonious/alter-ego-tate/", 
    #                                           "key"=>"/track/the-colonious/alter-ego-tate/", 
    #                                           "type"=>"track", "slug"=>"alter-ego-tate"}, 
    #                                "position"=>2, "start_time"=>125, "section_type"=>"track", "type"=>"section"}], 
    #                    "listener_count"=>0, 
    #                    "name"=>"Cloudcast api test", 
    #                    "tags"=>[{"url"=>"http://www.mixcloud.com/tag/electronic/", "type"=>"tag", "name"=>"Electronic", "key"=>"/tag/electronic/"},
    #                             {"url"=>"http://www.mixcloud.com/tag/chillout/", "type"=>"tag", "name"=>"Chillout", "key"=>"/tag/chillout/"},
    #                             {"url"=>"http://www.mixcloud.com/tag/beats/", "type"=>"tag", "name"=>"Beats", "key"=>"/tag/beats/"}], 
    #                    "url"=>"http://www.mixcloud.com/ctafong/cloudcast-api-test/", 
    #                    "pictures"=>{"medium"=>"http://tb1.mixcloud.com/w/100/h/100/q/85/upload/images/extaudio/4055039a-5422-41d9-bca1-151f7acc9671.gif",
    #                                 "extra_large"=>"http://tb1.mixcloud.com/w/600/h/600/q/85/upload/images/extaudio/4055039a-5422-41d9-bca1-151f7acc9671.gif",
    #                                 "large"=>"http://tb1.mixcloud.com/w/300/h/300/q/85/upload/images/extaudio/4055039a-5422-41d9-bca1-151f7acc9671.gif", 
    #                                 "medium_mobile"=>"http://tb1.mixcloud.com/w/80/h/80/q/75/upload/images/extaudio/4055039a-5422-41d9-bca1-151f7acc9671.gif", 
    #                                 "small"=>"http://tb1.mixcloud.com/w/25/h/25/q/85/upload/images/extaudio/4055039a-5422-41d9-bca1-151f7acc9671.gif", 
    #                                 "thumbnail"=>"http://tb1.mixcloud.com/w/50/h/50/q/85/upload/images/extaudio/4055039a-5422-41d9-bca1-151f7acc9671.gif"}, 
    #                    "description"=>"A 2 track podcast to do some api experiment", 
    #                    "updated_time"=>"2012-01-13T16:46:22Z", 
    #                    "play_count"=>1, 
    #                    "comment_count"=>0, 
    #                    "percentage_music"=>100, 
    #                    "user"=>{"username"=>"ctafong", 
    #                             "name"=>"ctafong", 
    #                             "url"=>"http://www.mixcloud.com/ctafong/", 
    #                             "pictures"=>{"medium"=>"http://tb1.mixcloud.com/w/150/h/150/q/85/images/graphics/00_Sitewide/default_user/default_user_600x600.png", 
    #                                          "extra_large"=>"http://tb1.mixcloud.com/w/600/h/600/q/85/images/graphics/00_Sitewide/default_user/default_user_600x600.png",
    #                                          "large"=>"http://tb1.mixcloud.com/w/300/h/300/q/85/images/graphics/00_Sitewide/default_user/default_user_600x600.png",
    #                                          "medium_mobile"=>"http://tb1.mixcloud.com/w/80/h/80/q/75/images/graphics/00_Sitewide/default_user/default_user_600x600.png",
    #                                          "small"=>"http://tb1.mixcloud.com/w/25/h/25/q/85/images/graphics/00_Sitewide/default_user/default_user_600x600.png", 
    #                                          "thumbnail"=>"http://tb1.mixcloud.com/w/50/h/50/q/85/images/graphics/00_Sitewide/default_user/default_user_600x600.png"}, 
    #                             "key"=>"/ctafong/", 
    #                             "type"=>"user"}, 
    #                    "key"=>"/ctafong/cloudcast-api-test/",
    #                    "created_time"=>"2012-01-13T16:39:49Z", 
    #                    "audio_length"=>366, 
    #                    "type"=>"cloudcast", 
    #                    "slug"=>"cloudcast-api-test", 
    #                    "favorite_count"=>0, 
    #                    "metadata"=>{"connections"=>{"listeners"=>"http://api.mixcloud.com/ctafong/cloudcast-api-test/listeners/", 
    #                                                 "similar"=>"http://api.mixcloud.com/ctafong/cloudcast-api-test/similar/", 
    #                                                 "favorites"=>"http://api.mixcloud.com/ctafong/cloudcast-api-test/favorites/", 
    #                                                 "comments"=>"http://api.mixcloud.com/ctafong/cloudcast-api-test/comments/"}}}
    @cloudcast = Mixcloud::Cloudcast.new('http://api.mixcloud.com/ctafong/cloudcast-api-test/?metadata=1')
  end

  it "should not have an instance variable named @metadata" do
    @cloudcast.instance_variables.should_not include(:@metadata)
  end

  it "should not have an instance variable named @pictures" do
    @cloudcast.instance_variables.should_not include(:@pictures)
  end

  it "should not have an instance variable named @sections" do
    @cloudcast.instance_variables.should_not include(:@sections)
  end

  it "should not have an instance variable named @tags" do
    @cloudcast.instance_variables.should_not include(:@tags)
  end

  it "should return the url of its listeners" do
    @cloudcast.listeners_url.should eq "http://api.mixcloud.com/ctafong/cloudcast-api-test/listeners/"
  end

  it "should return the url of similar cloudcasts" do
    @cloudcast.similar_url.should eq "http://api.mixcloud.com/ctafong/cloudcast-api-test/similar/"
  end

  it "should return the url of users who favorited this cloudcast" do
    @cloudcast.favorites_url.should eq "http://api.mixcloud.com/ctafong/cloudcast-api-test/favorites/"
  end

  it "should return the url of comments for this cloudcast" do
    @cloudcast.comments_url.should eq "http://api.mixcloud.com/ctafong/cloudcast-api-test/comments/"
  end

  it "should return the url of the associated user" do
    @cloudcast.user_url.should eq "http://api.mixcloud.com/ctafong/"
  end

  describe "#user" do
  
    it "should not have @user defined before calling #user" do
      @cloudcast.instance_variables.should_not include(:@user)
    end
    
    it "should return the associated user" do
      @cloudcast.user.username.should eq 'ctafong'
    end
    
    it "should have @user defined after calling #user" do
      @cloudcast.instance_variables.should include(:@user)
    end
  
    it "should return an object of class Mixcloud::User" do
      @cloudcast.user.class.should eq Mixcloud::User
    end
  end
  
end
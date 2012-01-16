require 'mixcloud'

describe "Mixcloud::UrlFixer" do

  describe "turn_www_to_api" do
    it "should perform substitute www for api correctly" do
      Mixcloud::UrlFixer.turn_www_to_api("http://www.mixcloud.com/").should eq "http://api.mixcloud.com/"
    end

    it "should strip off whitespaces when necessary" do
			Mixcloud::UrlFixer.turn_www_to_api("  http://www.mixcloud.com/   ").should eq "http://api.mixcloud.com/"
		end
  end
end
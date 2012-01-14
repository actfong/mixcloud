module Mixcloud::PopularNewHot
  def popular_url
    @url.gsub('http://www', 'http://api')  + 'popular/'
  end

  def new_url
    @url.gsub('http://www', 'http://api')  + 'new/'
  end

  def hot_url
    @url.gsub('http://www', 'http://api')  + 'hot/'
  end
end
Gem::Specification.new do |s|
  s.name = "mixcloud"
  s.version = "1.0.0"
  s.date = "2012-01-10"
  s.summary = "Ruby wrapper to access data of the public Mixcloud API. Visit http://www.mixcloud.com/developers/documentation/ for more info"
  s.description = "Ruby wrapper to access data of the public Mixcloud API"
  s.authors = ["Alex Fong"]
  s.email = "actfong@gmail.com"
  s.files = ["lib/mixcloud.rb",
             "lib/mixcloud/artist.rb",
             "lib/mixcloud/category.rb",
             "lib/mixcloud/cloudcast.rb",
             "lib/mixcloud/popular_new_hot.rb",
             "lib/mixcloud/resource.rb",
             "lib/mixcloud/search.rb",
             "lib/mixcloud/section.rb",
             "lib/mixcloud/tag.rb",
             "lib/mixcloud/track.rb",
             "lib/mixcloud/url_fixer.rb"
             "lib/mixcloud/user.rb"
            ]
  s.homepage = "http://www.github.com/actfong/mixcloud"
  s.add_dependency('rest-client', '~> 1.6.7')
  s.add_dependency('json', '~> 1.6.1')
  s.add_dependency('rspec', '~> 2.7.0')
end
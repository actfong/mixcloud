# $:.unshift(File.dirname(__FILE__)) unless
#   $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'rest_client'
require 'json'
require 'rspec'

require 'mixcloud/popular_new_hot'
require 'mixcloud/url_fixer'
require 'mixcloud/resource'
require 'mixcloud/artist'
require 'mixcloud/category'
require 'mixcloud/cloudcast'
require 'mixcloud/tag'
require 'mixcloud/track'
require 'mixcloud/user'
require 'mixcloud/search'
    
# USER
# alex_url ='http://api.mixcloud.com/ctafong/?metadata=1'
# alex = JSON.parse RestClient.get alex_url
# dave = Mixcloud::User.new(alex_url)
# puts alex.inspect
# puts dave.medium_picture_url
# puts dave.extra_large_picture_url

# ARTIST
# aphex_url = 'http://api.mixcloud.com/artist/aphex-twin/?metadata=1/'
# aphex = Mixcloud::Artist.new(aphex_url)
# aphex = JSON.parse RestClient.get aphex_url
# puts aphex.inspect

# Category
# ambient_url = 'http://api.mixcloud.com/categories/ambient/?metadata=1'
# ambient = JSON.parse RestClient.get('http://api.mixcloud.com/categories/ambient/?metadata=1')
# ambient = Mixcloud::Category.new(ambient_url)

# Cloudcast
# party_time = Mixcloud::Cloudcast.new('http://api.mixcloud.com/spartacus/party-time/?metadata=1')
# party_time = JSON.parse(RestClient.get 'http://api.mixcloud.com/ctafong/cloudcast-api-test/?metadata=1')
# puts party_time

# TAG
# tag = JSON.parse(RestClient.get 'http://api.mixcloud.com/tag/funk/?metadata=1')
# tag = Mixcloud::Tag.new('http://api.mixcloud.com/tag/funk/?metadata=1')
# puts tag.inspect

# TRACK
# track = JSON.parse RestClient.get('http://api.mixcloud.com/track/the-colonious/alter-ego-tate/?metadata=1')
# track = Mixcloud::Track.new('http://api.mixcloud.com/track/the-colonious/alter-ego-tate/?metadata=1')
# puts track.inspect

# puts track.artist_url
# puts track.artist

# Search
# search_url = 'http://api.mixcloud.com/search/?q=aphex+twin&type=artist'
# search_result = JSON.parse RestClient.get 'http://api.mixcloud.com/search/?q=aphex+twin&type=artist'
# puts search_result['data']
# results = Mixcloud::Search.artist('aphex twin')
# puts results.inspect
# results.each do |result|
  # puts result.name
  # puts result.url
  # puts result.key
  # puts result.slug
# end

# results = Mixcloud::Search.find_cloudcast('party time')
# party_time = results[2]
# results = Mixcloud::Search.find_tag('jazzanova')
# puts results.inspect

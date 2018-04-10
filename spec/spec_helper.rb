require 'rspec'
require 'mixcloud'
require 'fakeweb'
require 'rspec/its'

RSpec.configure do |config|
  config.color = true
  config.formatter = 'documentation'
end

def fakeweb_mixcloud_search_url(name, type, response)
  FakeWeb.register_uri(:get, "http://api.mixcloud.com/search/?q=#{name}&type=#{type}", 
                       :body => response, 
                       :content_type => "application/json")
end

def fakeweb_mixcloud_url(type, slug, response)
  FakeWeb.register_uri(:get, "http://api.mixcloud.com/#{type}/#{slug}/?metadata=1", 
                       :body => response, 
                       :content_type => "application/json")
end
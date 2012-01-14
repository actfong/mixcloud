module Mixcloud
  class Search

    # The codeblock below defines the following class methods, :find_artist, :find_cloudcast, :find_user, :find_tag
    SEARCH_TYPES = ['artist', 'cloudcast', 'user', 'tag']
    SEARCH_TYPES.each do |type|
      define_singleton_method "find_#{type}" do | name |
        search_url = create_search_url(name, type)
        data_returned = JSON.parse(RestClient.get search_url)['data']
        search_results = turn_data_into_mixcloud_resources(data_returned, Mixcloud.const_get(type.capitalize))
        search_results
      end
    end

    private
    def self.create_search_url(name, type)
      name.gsub! " ", "+"
      "http://api.mixcloud.com/search/?q=#{name}&type=#{type}"
    end

    def self.turn_data_into_mixcloud_resources(results, klass)
      search_results = []
      results.each do |result|
        resource_api_url = result['url'].gsub('http://www','http://api')
        resource = klass.new(resource_api_url)
        search_results << resource
      end
      search_results
    end

  end
end
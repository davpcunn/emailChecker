require 'google-search'
require_relative 'search_result.rb'

class Searcher
  def search(co_name)
    search = Google::Search::Web.new do |search|
      search.query = co_name
      search.size = :small
    end.map.with_index{ |result, i|  SearchResult.new(result, i, co_name) }
  end
end
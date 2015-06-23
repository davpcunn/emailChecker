require 'google_search'
require 'search_result'
class Searcher
 def search(co_name)
    search = Google::Search::Web.new do |search|
      search.query = co_name
      search.size = :small
    end.map { |result, i|  SearchResult.new(result, co_name, i) }
  end
end
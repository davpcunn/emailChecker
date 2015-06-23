require
class Searcher
 def search(co_name)
    search = Google::Search::Web.new do |search|
      search.query = co_name
      search.size = :small
    end.map()
  end
end
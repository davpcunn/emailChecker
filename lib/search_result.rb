require 'rubygems'
require 'domainatrix'

class SearchResult
  @rank = -1
  attr_accessor :uri, :title, :rank, :domain
  def initialize(result, rank)
    @uri = Domainatrix.parse(result.uri)
    @title = result.title
    @rank = rank
    @domain  = @uri.domain + '.' + @uri.public_suffix
  end
end
require 'levenshtein'
require 'rubygems'
require 'domainatrix'

class SearchResult
  @rank = -1
  attr_accessor :uti, :title, :rank, :titleWeight, :domain
  def initialize(result, rank, query)
    @uri = result.uri
    @title = result.title
    @rank = rank
    @domain  = Domainatrix.parse(@uri).domain
    @titleWeight = distance(@title, query)
  end
end
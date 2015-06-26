require 'levenshtein'
require 'rubygems'
require 'domainatrix'

class SearchResult
  @rank = -1
  attr_accessor :uti, :title, :rank, :domain, :domain_distance
  def initialize(result, rank, query)
    @uri = result.uri
    @title = result.title
    @rank = rank
    @domain  = Domainatrix.parse(@uri).domain
    @domain_distance = Levenshtein.distance(@domain, query.downcase)
  end
end
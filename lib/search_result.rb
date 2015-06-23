class SearchResult
  @rank = -1

  attr_accessor :uti, :title, :rank, :titleWeight
  def initialize(result, rank, query)
    @uri = result.uri
    @title = result.title
    @rank = rank
    @titleWeight
  def getTitleWeight(title)
  end
end
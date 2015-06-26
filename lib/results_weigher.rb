require 'activesupport'
require_relative './search_result.rb'

class ResultsWeigher
  def initialize(relative_weights)
    @relative_weights = relative_weights
  end
  def sort(results)
    results.sort_by{|result| weigh(result)}
  end
  private
  def weigh(result)
    result_weight = result.rank * @relative_weights[0] + results.title_distance * @relative_weights[1]
    result_weight.to_i
  end
end
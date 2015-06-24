equire 'spec_helper'
require_relative '../../lib/search_result.rb'

describe 'Search Result' do

  it "adds 2 numbers" do
    expect(SearchResult.new().add).to eq(3)
  end

end
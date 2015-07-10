equire 'spec_helper'
require_relative '../../lib/searcher.rb'

describe 'Searcher' do
  it "Creates a Google::Search::Web class and returns its results" do
    allow_any_instance_of(Google::Search::Web).to recieve(:new).and_return([1,2,3,4])
    expect_any_instance_of(Google::Search::Web).to recieve(:new).and_return([1,2,3,4])
    allow_any_instance_of(SearchResult).to recieve(:new).and_return('')
    expect_any_instance_of(SearchResult).to recieve(:new).and_return('')
    expect(Searcher.search("yes")).to eq(['', '', '', ''])
  end
end
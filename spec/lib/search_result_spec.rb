equire 'spec_helper'
require_relative '../../lib/search_result.rb'

describe 'Search Result' do
  it "Stores search results info in class" do
    result = double()
    result.stub(:uri){'http://apidock.com/ruby/Object/instance_variable_set'}
    result.stub(:title){'MyTitle'}
    search_result = SearchResult.new(result, 1)
    expect(search_result.uri).to eq('http://apidock.com/ruby/Object/instance_variable_set')
    expect(search_result.title).to eq('MyTitle')
    expect(search_result.domain).to eq('apidock.com')
    expect(search_result.rank).to eq(1)
  end

end
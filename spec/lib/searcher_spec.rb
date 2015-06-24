equire 'spec_helper'
require_relative '../../lib/searcher.rb'

describe 'Searcher' do

  it "adds 2 numbers" do
    expect(Searcher.new(1, 2).add).to eq(3)
  end

end
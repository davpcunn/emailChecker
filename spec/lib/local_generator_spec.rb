equire 'spec_helper'
require_relative '../../lib/local_generator.rb'

describe 'NumberAdder' do

  it "adds 2 numbers" do
    expect(NumberAdder.new(1, 2).add).to eq(3)
  end

end
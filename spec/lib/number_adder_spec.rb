require 'spec_helper'
require_relative '../../lib/number_adder.rb'

describe 'NumberAdder' do

  it "adds 2 numbers" do
    expect(NumberAdder.new(1, 2).add).to eq(3)
  end

end

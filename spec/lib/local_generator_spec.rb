equire 'spec_helper'
require_relative '../../lib/local_generator.rb'

describe 'local gernerator' do

  it "generates locals" do
    expect(LocalGen.new(name).add).to eq(3)
  end

end
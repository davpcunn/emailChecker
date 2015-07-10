equire 'spec_helper'
require_relative '../../lib/local_generator.rb'

describe 'local gernerator' do

  it "generates permutations of the employee's name" do
    name = double()
    name.stub(:firstName) {"david"}
    name.stub(:lastName) {"cunningham"}
    name.stub(:firstInitial){"d"}
    name.stub(:lastInitial){"c"}
    expect(LocalGen.new(name).add).to eq(['david', 'cunningham', 'dcunningham', 'davidcunningham', 'davidc', 'dc', 'cdavid', 'cunninghamdavid', 'cunninghamd', 'd.cunningham', 'david_cunningham', 'david_c','d_c','c_david', 'cunningham_david', 'cunningham_d','d_cunningham', 'david_cunningham', 'david_c','d_c','c_david', 'cunningham_david', 'cunningham_d'])
  end
end
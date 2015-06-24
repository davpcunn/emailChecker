equire 'spec_helper'
require_relative '../../lib/address_verifier.rb'

describe 'Address Verifier' do

  it "adds 2 numbers" do
    expect(AddressVerifier.new('david@preferral.com').).to eq(3)
  end

end
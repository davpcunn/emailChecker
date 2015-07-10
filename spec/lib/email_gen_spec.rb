require 'spec_helper'
require_relative '../../lib/email_gen.rb'

@names = ['david', 'bob', 'miranda']
@search_results = Array.new(2)
@search_results[0] = Object.new.stub(:domain) do
  "preferral.com"
end
@search_results[1] = Object.new.stub(:domain) do
  "gmail.com"
end
@correct_list = ['david@preferral.com', 'david@gmail.com', 'bob@preferral.com', 'bob@gmail.com', 'miranda@gmail.com']
describe 'EmailGenerator' do

  it "Takes a list of names and search results and generates list of emails for each name at each domain" do
    expect(EmailGen.new(@names, @search_results).emails).to eq(@correct_list)
  end

end

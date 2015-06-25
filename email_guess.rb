require 'sinatra'
require 'cgi'
require 'json'
require 'faroo'
require 'open-uri'
require 'dotenv'
require 'net/http'
require 'google_search'
require_relative 'lib/address_verifier.rb'
require_relative 'lib/employee_name.rb'
require_relative 'lib/local_generator.rb'
require_relative 'lib/search_result.rb'
require_relative 'lib/searcher.rb'
require_relative 'lib/domain_checker.rb'

address_verifier = AddressVerifier.new

post '/api/guess.json' do
  data=Hash.new
  data['employee'] = params[:emp_name]
  company['company'] = params[:co_name]
  data['verified_emails']=[]
  data['checked_domains']=[]
  locals = LocalGen.new(EmployeeName.new(data['employee'])).gen
  search_results = Searcher.search(data['co_name'])
  #perform smtp checks on the first 10 or so results
  for i in 0..10
    data['verified_emails'] << DomainChecker.new(locals, search_results[i].domain, address_verifier).check
    data['checked_domains'] << search_results[i].domain
  end
  data.to_json
end
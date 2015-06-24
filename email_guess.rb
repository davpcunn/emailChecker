require 'cgi'
require 'json'
require 'faroo'
require 'open-uri'
require 'dotenv'
require 'net/http'
require 'twitter'
require 'google_search'
require_relative 'lib/address_verifier.rb'
require_relative 'lib/employee_name.rb'
require_relative 'lib/local_generator.rb'
require_relative 'lib/search_result.rb'
require_relative 'lib/searcher.rb'


def check_emails(locals, domain, verifier) #checks all names for a certain domain
  all_valid = true
  valid_addresses = []
  locals.each do |local|
    email = local + '@' + domain
    data = verifier.verify(address)
    if data['error'] #break if you experience an error
      break
    elsif data['valid'] #if it's valid add it
      valid_addresses.push(email)
    else
      all_valid = false
  end
  if all_valid == true #if all variations are valid, mail server is catching everything. Results are unreliable.
    return []
  else
    return valid_addresses
  end
end

verifier = AddressVerifier.new

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
    data['verified_emails'] << check_emails(search_results[i].domain, locals, verifier)
    data['checked_domains'] << search_results[i].domain
  end
  data.to_json
end
require 'sinatra'
require 'cgi'
require 'json'
require 'open-uri'
require 'dotenv'
require 'net/http'
require_relative 'lib/address_verifier.rb'
require_relative 'lib/employee_name.rb'
require_relative 'lib/local_generator.rb'
require_relative 'lib/search_result.rb'
require_relative 'lib/searcher.rb'
require_relative 'lib/domain_checker.rb'

address_verifier = AddressVerifier.new
APP_ENV = 'development'
Dotenv.load(
  File.expand_path("../.#{APP_ENV}.env", __FILE__),
  File.expand_path("../.env",  __FILE__))

post '/api/guess.json' do
  ret = Hash.new
  data = JSON.parse(request.body.read)
  if data.has_key?('employee')==false || data.has_key?('company')==false
    ret['error'] = true
    ret['error_text'] = 'request parameters not valid'
  else
    puts 1
    ret['error'] = false
    ret['verified_emails']=[]
    ret['checked_domains']=[]
    locals = LocalGen.new(EmployeeName.new(data['employee'])).gen
    puts 2
    search_results = Searcher.new.search(data['company'])
    puts 3
    #perform smtp checks on the first 10 or so results
    for i in 0..10
      puts 4
      ret['verified_emails'] << DomainChecker.new(locals, search_results[i].domain, address_verifier).check
      puts 5
      ret['checked_domains'] << search_results[i].domain
    end
  end
  puts 6
  ret.to_json
end
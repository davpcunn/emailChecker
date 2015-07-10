require 'sinatra'
require 'json'
require 'dotenv'
require_relative 'lib/email_verifier_relay.rb'
require_relative 'lib/employee_name.rb'
require_relative 'lib/local_generator.rb'
require_relative 'lib/search_result.rb'
require_relative 'lib/searcher.rb'
require_relative 'lib/email_gen.rb'

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
    ret['error'] = false
    locals = LocalGen.new(EmployeeName.new(data['employee'])).gen
    search_results = Searcher.new.search(data['company'])
    #Generate the emails
    emails = EmailGen.new(locals, search_results).emails
    #relay the emails to the nodejs verifier
    relay = EmailVerifierRelay.new
    relay.connect
    ret['verified_emails'] = relay.send(emails)
  end
  ret.to_json
end
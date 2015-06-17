require 'cgi'
require 'json'
require 'faroo'
require 'open-uri'
require 'dotenv'
require 'net/http'
require 'twitter'
require 'google_search'

def validate(email) do
  begin
    valiid
    data['validity'] = EmailVerifier.check(data['email'])
    data['error'] = false
  rescue EmailVerifier::OutOfMailServersException
    data['error'] = true
    data['errorText'] = "out_of_mail_server: appears to point to dead mail server"
  rescue EmailVerifier::NoMailServerException
    data['error'] = true
    data['errorText'] = "no_mail_server: appears to point to domain which doesn't handle e-mail"
  rescue EmailVerifier::FailureException
    data['error'] = true
    data['errorText'] = "failure: could not be checked if is real"
  end
  return data
end

def get_possible_names(employee) #takes employee name and turns it into local patterns
end

def check_emails(locals, domain) #checks all names for a certain domain
  all_valid = true
  valid_addresses = []
  locals.each do |local|
    email = local + '@' + domain
    data = validate(address)
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

def faroo_search(co_name)
  addresses = []
  #get results
  Faroo.new(ENV['API_key']).web(co_name).results.each do |item|
    addresses << item.domain
  end
  return addresses
end

def google_search(co_name)
  serach = Google::Search::Web.new do |search|
    search.query = co_name
    search.size = :small
  end.map(&:domain)
  return search
end

def twitter_search(co_name)
  addresses = []
  #configure twitter client
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["YOUR_CONSUMER_KEY"]
    config.consumer_secret     = ENV["YOUR_CONSUMER_SECRET"]
    config.access_token        = ENV["YOUR_ACCESS_TOKEN"]
    config.access_token_secret = ENV["YOUR_ACCESS_SECRET"]
  end
  results = client.user_search(co_name)#search twitter for company name
  results.each do |user| #search twitter for company's website
    if user.website?
      addresses << user.website
    end
end

EmailVerifier.config do |config|
  config.verifier_email = ENV['base_email']
end

post '/api/guess.json' do
  data=Hash.new
  data['emp_name'] = params[:emp_name]
  data['co_name'] = params[:co_name]
  data['verified_emails'] = []
  data['checked_domains'] = []
  locals = get_possible_names(data['emp_name'])
  (data['checked_domains'] << faroo_search(data['co_name'])
  (data['checked_domains'] << twitter_search(data['co_name'])
  data['checked_domain'].each do |address|
    data['verified_emails'] << check_emails(address, locals)
  end
  data.to_json
end
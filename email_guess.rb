require 'cgi'
require 'json'
require 'faroo'
require 'open-uri'
require 'dotenv'
require 'net/http'

def get_possible_names(employee) #takes employee name and turns it into local patterns
end


def check_names(locals, domain) #checks all names for a certain domain
  uri = URI(ENV['email_verifier url'])
  all_valid = true
  valid_addresses = []
  locals.each do |local|
    address = local + '@' + domain
    res = Net::HTTP.post_form(uri, 'email' => address)
    if res.body.error #break if you experience an error
      break
    elsif res.body.valid #if it's valid add it
      valid_addresses.push
    else
      all_valid = false
  end
  if all_valid == true #if all variations are valid, mail server is catching everything. Results are unreliable.
    return []
  else
    return valid_addresses
  end
end

def faroo_search(co_name, locals)
  addresses = []
  #get api key
  key = ENV['API_key']
  #get results
  data = Faroo.new(key).web(co_name)
  data.results.each do |item|
    puts item.domain
    (addresses << evaluate_addresses(locals, item.domain)).flatten!
  end
  return addresses
end

def twitter_search(locals, co_name)
  #search twitter for company name
  #take the first 10 results
  results.each do |profile|
    #if there is a website on the profile, check names on the website
  end
end


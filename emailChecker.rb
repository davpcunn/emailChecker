require 'sinatra'
require 'active_support'
require 'email_verifier'
require 'json'

EmailVerifier.config do |config|
  config.verifier_email = "realname@realdomain.com"
end

#Non json field based import
get '/validate' do
	erb :emailverificationform
end


#json based field
post '/api/validate.json' do
	data = Hash.new
	begin
		data['email'] = params[:email]
		data['validity'] = EmailVerifier.check(data['email'])
		data['validFormat'] = true
	rescue
		data['validFormat'] = false
	end
	data.to_json
end
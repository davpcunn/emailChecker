require 'sinatra'
require 'active_support'
require 'email_verifier'
require 'json'
require 'dotenv'

EmailVerifier.config do |config|
  config.verifier_email = 'realname@realdomain.com'
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
    data['error'] = false
    puts data['email']
    puts data['validity']
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
  data.to_json
end
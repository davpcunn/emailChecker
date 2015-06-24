require 'active_support'
require 'email_verifier'
require 'dotenv'

class AddressVerifier
  def initialize
    EmailVerifier.config do |config|
      config.verifier_email = ENV['base_email']
    end
  end
  def validate(email) do
    begin
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
end
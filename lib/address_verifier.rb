require 'active_support'
require 'email_verifier'
require 'dotenv'

class AddressVerifier
  def initialize
    print 7
    puts ENV['BASE_EMAIL']
    EmailVerifier.config do |config|
      config.verifier_email = 'realname@realdomain'
    end
    print 8
  end
  def verify(email)
    data=Hash.new
    puts 9
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
    puts 10
    return data
  end
end
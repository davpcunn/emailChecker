ENV['RACK_ENV'] = 'test'

require './email_checker'
require 'test/unit'
require 'rack/test'

class EmailCheckerTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_valid_email
    post '/api/validate.json', :email => 'david@preferral.com'
    puts last_response

  end

  def test_invalid_email
  end
  def test_out_of_mail
  end
  def test_no_mail_server
  end
  def test_verification_failure
  end
end


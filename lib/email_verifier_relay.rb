require 'dotenv'
require 'net/http'
require 'uri'

class EmailVerifierRelay #sends a request to the email verifier script
  attr_accessor :uri
  def initialize
    puts 'Working 1'
    @http = nil
    @request = nil
    @uri = URI.parse(ENV['Verifier_Host']||'https://localhost')
    puts 'Working 2'
    @uri.port = (ENV['Verifier_Host']|| 3030)
  end
  def connect
    puts 'Working 3'
    @http = Net::HTTP.new(uri.host, uri.port)
    @http.use_ssl = true
    @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end
  def send(emails)
    @request = Net::HTTP::Post.new("/check")
    @request.add_field('Content-Type', 'application/json')
    puts 'Working 3'
    @request.body = {'emails' => emails}
    puts 'Working 4'
    @http.request(@request)
  end
end
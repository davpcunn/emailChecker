require 'spec_helper'
require_relative '../../lib/email_verifier_relay.rb'

@test_emails = ['david@preferral.com', 'bob@gmail.com']

describe 'Email Verifier Relay' do
  describe 'Gets the name of the verifier server' do
    before do
      @relay = EmailVerifierRelay.new
    end
    it 'initializes host and port to enviormental variables' do
      ENV['Verfier_Host'] = 'www.google.com'
      ENV['Verifier_Port'] = '8080'
      expect(@relay.uri.host).to eq('www.google.com')
      expect(@relay.uri.port).to eq('8080')
    end
    it 'if there are no enviormental varaibles, initializes to localhost:3030'
      ENV['Verifier_Host'] = nil
      ENV['Verifier_Port'] = nil
      expect(@relay.uri.host).to eq('localhost')
      expect(@relay.uri.port).to eq('3030')
    end
  end
  describe 'Connecting to the server' do
    before do
      @relay = EmailVerifierRelay.new
      @relay.connect
      @initial_http = @relay.get_instance_variable(:@http)
    end
    it 'connects to the server specified by the uri' do
      expect (@initial_http.port).to eq(@relay.uri.port)
      expect (@initial_http.host).to eq(@relay.uri.host)
    end
    it "must reconnect if the uri is modified" do
      @relay.uri=URI.parse('www.google.com')
      expect (@relay.get_instance_variable(:@http).port).not_to eq(@relay.uri.port)
      expect (@relay.get_instance_variable(:@http).host).not_to eq(@relay.uri.host)
      @relay.connect
      expect(@relay.get_instance_variable(:@http).port).to eq(@relay.uri.port)
      expect(@relay.get_instance_variable(:@http).host).to eq(@relay.uri.host)
    end
  end
  describe 'Sending the request' do
    before do
      @relay = EmailVerifierRelay.new
      @relay.emails = @test_emails
      http_double = Object.new
      http_double.stub(:request) do |arg| #send back the method
        arg.emails
      end
      @relay.instance_variable_set(:@http, http_double)
    end
    it 'Sends request with emails to the verifier server' do
      expect(@relay.send(@test_emails)).to eq(@test_emails)
    end
end
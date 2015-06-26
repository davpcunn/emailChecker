class DomainChecker #checks domain for the locals email
  attr_accessor :emails
  def initialize(locals, domain, address_verifier)
    #create a list of emails
    @emails = []
    @address_verifier = address_verifier
    locals.each do |local|
      @emails << local + '@' + domain
    end
  end
  def check
    valid_addresses = []
    @emails.each do |email|
      data = @address_verifier.verify(email)
      if data['error'] #break if you experience an error
        break
      elsif data['valid'] #if it's valid add it
        valid_addresses << email
      else
        all_valid = false
      end
    end
    if all_valid == true #if all variations are valid, mail server is catching everything. Results are unreliable.
      return []
    else
      return valid_addresses
    end
  end
end
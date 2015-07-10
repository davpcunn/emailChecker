class EmailGen #checks domain for the locals email
  attr_accessor :emails
  def initialize(locals, search_results)
    #create a list of emails
    @emails = []
    search_results.each do |result|
      locals.each do |local|
        @emails << local + '@' + result.domain
      end
    end
  end
end
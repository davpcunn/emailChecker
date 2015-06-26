#parses and stores content for an employees name
class EmployeeName
  attr_accessor :first_name, :last_name, :first_initial, :last_initial
  def initialize (name)
    parsed = name.downcase.split(' ')
    @first_name = parsed[0]
    @last_name = parsed[1]
    @first_initial = @first_name[0]
    @last_initial = @last_name[0]
  end
end
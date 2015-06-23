#parses and stores content for an employees name
class Employee_Name
  def initialize (name)
    parsed = name.downcase.split(' ')
    @firstname = parsed[0]
    @lastname = parsed[1]
    @firstinitial = @firstname[0]
    @lastinitial = @lastname[0]
  end
end
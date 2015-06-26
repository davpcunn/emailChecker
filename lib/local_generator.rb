require_relative 'employee_name.rb'

class LocalGen
  def initialize(employee)
    @employee = employee
  end
  def gen
    locals = []
    locals << @employee.first_name #david
    locals << @employee.last_name #cunningham

    locals << @employee.first_initial + @employee.last_name #dcunningham
    locals << @employee.first_name + @employee.last_name #davidcunningham
    locals << @employee.first_name + @employee.last_initial #davidc
    locals << @employee.first_initial + @employee.last_initial #dc

    locals << @employee.last_initial + @employee.first_name #cdavid
    locals << @employee.last_name + @employee.first_name #cunninghamdavid
    locals << @employee.last_name + @employee.first_initial #cunninghamd

    locals << @employee.first_initial + '.' + @employee.last_name #d.cunningham
    locals << @employee.first_name + '.' + @employee.last_name #david.cunningham
    locals << @employee.first_name + '.' + @employee.last_initial #david.c
    locals << @employee.first_initial + '.' + @employee.last_initial #d.c

    locals << @employee.last_initial + '.' + @employee.first_name #c.david
    locals << @employee.last_name + '.' + @employee.first_name #cunningham.david
    locals << @employee.last_name + '.' + @employee.first_initial #cuningham.d

    locals << @employee.first_initial+ '_' +@employee.last_name #d_cunningham
    locals << @employee.first_name + '_' + @employee.last_name #david_cunningham
    locals << @employee.first_name + '_' + @employee.last_initial #david_c
    locals << @employee.first_initial + '_' + @employee.last_initial #d_c

    locals << @employee.last_initial + '_' + @employee.first_name #c.david
    locals << @employee.last_name + '_' + @employee.first_name #cunningham.david
    locals << @employee.last_name + '_' + @employee.first_initial #cuningham.d
  end
end
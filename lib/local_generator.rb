class LocalGen
  def initialize(employee)
    @employee = employee
  end
  def gen
    locals = []
    locals << @employee.firstname #david
    locals << @employee.lastname #cunningham

    locals << @employee.firstinitial + @employee.lastname #dcunningham
    locals << @employee.firstname + @employee.lastname #davidcunningham
    locals << @employee.firstname + @employee.lastinitial #davidc
    locals << @employee.firstinitial + @employee.lastinitial #dc

    locals << @employee.lastinitial + @employee.first #cdavid
    locals << @employee.last + @employee.first #cunninghamdavid
    locals << @employee.last + @employee.firstinitial #cunninghamd

    locals << @employee.firstinitial + '.' + @employee.last #d.cunningham
    locals << @employee.first + '.' + @employee.last #david.cunningham
    locals << @employee.first + '.' + @employee.lastinitial #david.c
    locals << @employee.firstinitial + '.' + @employee.lastinitial #d.c

    locals << @employee.lastinitial + '.' + @employee.first #c.david
    locals << @employee.last + '.' + @employee.first #cunningham.david
    locals << @employee.last + '.' + @employee.firstinitial #cuningham.d

    locals << @employee.firstinitial+ '_' +@employee.last #d_cunningham
    locals << @employee.first + '_' + @employee.last #david_cunningham
    locals << @employee.first + '_' + @employee.lastinitial #david_c
    locals << @employee.firstinitial + '_' + @employee.lastinitial #d_c

    locals << @employee.lastinitial + '_' + @employee.first #c.david
    locals << @employee.last + '_' + @employee.first #cunningham.david
    locals << @employee.last + '_' + @employee.firstinitial #cuningham.d
  end
end
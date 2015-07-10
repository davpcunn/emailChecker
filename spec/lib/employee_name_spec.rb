equire 'spec_helper'
require_relative '../../lib/employee_name.rb'

describe 'Employee Name' do
  it "Handles Name" do
    name = EmployeeName.new("David Cunningham")
    expect(name.firstname).to eq('david')
    expect(name.lastname).to eq('cunningham')
    expect(name.firstintial).to eq('d')
    expect(name.firstintial).to eq('c')
  end
  it "Handles titles" do
    name = EmployeeName.new("David Cunningham, MD")
    expect(name.firstname).to eq('david')
    expect(name.lastname).to eq('cunningham')
    expect(name.firstintial).to eq('d')
    expect(name.firstintial).to eq('c')
end
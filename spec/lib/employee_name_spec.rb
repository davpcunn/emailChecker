equire 'spec_helper'
require_relative '../../lib/employee_name.rb'

describe 'Employee Name' do

  it "Handles Name" do
    expect(EmployeeName.new("David Cunningham").firstname).to eq('david')
    expect(EmployeeName.new("David Cunningham").lastname).to eq('cunningham')
    expect(EmployeeName.new("David Cunningham").firstintial).to eq('d')
    expect(EmployeeName.new("David Cunningham").firstintial).to eq('c')
  end
  it "Handles titles" do
    expect(EmployeeName.new("Dr. David Cunningham").firstname).to eq('david')
    expect(EmployeeName.new("Dr. David Cunningham").lastname).to eq('cunningham')
    expect(EmployeeName.new("Dr. David Cunningham").firstintial).to eq('d')
    expect(EmployeeName.new("Dr. David Cunningham").firstintial).to eq('c')
end
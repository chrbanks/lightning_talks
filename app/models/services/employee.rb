module Services
  class Employee < ActiveService::Base
    uses_api Rails.configuration.employees_api

    attribute :id, source: 'EmployeeId'
    attribute :username, source: 'HHRepId'
    attribute :first_name, source: 'FirstName'
    attribute :last_name, source: 'LastName'
    attribute :email, source: 'Email'
  end
end

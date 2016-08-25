class User < ApplicationRecord
  include Gravtastic
  gravtastic

  before_create :set_admin, :get_info
  has_many :meetings

  validates :username, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def set_admin
    if self.username == 'cbanks'
      self.admin = true
    end
  end

  def get_info
    employee = Services::Employee.find(self.username)
    self.first_name = employee.first_name
    self.last_name = employee.last_name
    self.email = employee.email
  end
end

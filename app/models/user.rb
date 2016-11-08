class User < ApplicationRecord
  include Gravtastic
  gravtastic

  before_create :set_admin, unless: :skip_callbacks
  before_create :get_info, unless: :skip_callbacks
  has_many :meetings

  validates :username, presence: true

  attr_accessor :skip_callbacks

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

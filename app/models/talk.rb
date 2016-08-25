class Talk < ApplicationRecord
  belongs_to :meeting
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
end

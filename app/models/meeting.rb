class Meeting < ApplicationRecord
  belongs_to :user
  has_many :talks, dependent: :destroy

  validates :date, presence: true
  validates :title, presence: true
  validates :location, presence: true
end

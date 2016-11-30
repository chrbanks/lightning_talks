class Meeting < ApplicationRecord
  belongs_to :user
  has_many :talks, dependent: :destroy

  validates :date, presence: true
  validates :title, presence: true
  validates :location, presence: true
  validates :user, presence: true

  scope :upcoming, -> { where("date > ?", Time.now) }

  scope :next, -> { where("date > ?", Time.now).order(date: 'asc').first }
end

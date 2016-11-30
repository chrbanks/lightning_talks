class Talk < ApplicationRecord
  belongs_to :meeting
  belongs_to :user, counter_cache: true
  has_many :favorites

  acts_as_commentable
  acts_as_taggable

  CATEGORIES = %w(agile developer_tools design front_end database learning news miscellaneous)

  validates :title, presence: true
  validates :description, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :meeting, presence: true
  validates :user, presence: true

  scope :latest, -> { order(created_at: :desc) }

  scope :upcoming, -> { joins(:meeting).where("meetings.date >= ?", Time.now) }
  scope :recent, -> { joins(:meeting).where("meetings.date < ?", Time.now) }
  scope :popular, -> { where('favorites_count >= 5') }

  def next
    meeting.talks.where("id > ?", id).first
  end

  def previous
    meeting.talks.where("id < ?", id).last
  end

  def popular?
    favorites.size >= 5
  end
end

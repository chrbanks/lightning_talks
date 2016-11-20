class Talk < ApplicationRecord
  belongs_to :meeting
  belongs_to :user
  has_many :favorites

  acts_as_commentable

  CATEGORIES = %w(mobile developer_tools design front_end database learning news)
  
  validates :title, presence: true
  validates :description, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :meeting, presence: true
  validates :user, presence: true

  def next
    meeting.talks.where("id > ?", id).first
  end

  def previous
    meeting.talks.where("id < ?", id).last
  end
end

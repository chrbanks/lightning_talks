class Talk < ApplicationRecord
  belongs_to :meeting
  belongs_to :user

  CATEGORIES = %w(mobile developer_tools design front_end database learning news)
  
  validates :title, presence: true
  validates :description, presence: true
  validates :category, inclusion: { in: CATEGORIES, allow_nil: true }
end

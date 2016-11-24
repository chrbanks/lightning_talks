class User < ApplicationRecord
  include Gravtastic
  gravtastic default: 'identicon'

  has_many :meetings
  has_many :talks
  has_many :favorites
  has_many :favorite_talks, through: :favorites, source: :talk
  has_many :active_relationships, class_name:  'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  'Relationship',
                                   foreign_key: 'followed_id',
                                   dependent:   :destroy
  has_many :followed_users, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :username, presence: true

  before_create :set_admin, :get_info

  def full_name
    "#{first_name} #{last_name}"
  end

  def follow!(user)
    active_relationships.create!(followed: user)
  end

  def unfollow!(user)
    active_relationships.find_by(followed: user).destroy
  end

  def following?(user)
    followed_users.include? user
  end

  def favorite?(talk)
    favorites.exists?(talk: talk)
  end

  def favorite!(talk)
    favorites.create!(talk: talk)
  end

  def unfavorite!(talk)
    favorites.find_by(talk: talk).destroy
  end

  def speaker?
    talks.any?
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

class Favorite < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :talk, counter_cache: true
end

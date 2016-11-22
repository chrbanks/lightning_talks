require 'rails_helper'

RSpec.describe Relationship, type: :model do
  subject do
    build :relationship, follower: build(:user, username: 'Foo'),
                         followed: build(:user, username: 'Bar')
  end

  describe 'Attributes' do
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :follower_id }
    it { is_expected.to respond_to :followed_id }
  end

  describe 'Validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:follower) }
    it { is_expected.to validate_presence_of(:followed) }
  end
end

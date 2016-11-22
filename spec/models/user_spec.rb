require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe 'Attributes' do
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :username }
    it { is_expected.to respond_to :first_name }
    it { is_expected.to respond_to :last_name }
    it { is_expected.to respond_to :email }
    it { is_expected.to respond_to :admin }
  end

  describe 'Validations' do
    context 'valid user' do
      it { is_expected.to be_valid }
      it { is_expected.to validate_presence_of :username }
    end
  end

  describe 'Following users' do
    let(:chris)  { create :user, username: 'cbanks' }
    let(:martin) { create :user, username: 'mrodriquez' }

    describe '#following?' do

      it 'returns false when not following a user' do
        expect(user.following? martin).to be_falsey
      end

      it 'returns true when following a user' do
        create :relationship, follower: user, followed: martin
        expect(user.following? martin).to be_truthy
      end
    end

    describe '#follow!' do

      it 'follows the other user and returns true' do
        expect(chris.following? martin).to be_falsey
        expect(chris.follow! martin).to be_truthy
        expect(chris.following? martin).to be_truthy
      end
    end

    describe '#unfollow' do
      before { chris.follow! martin }

      it 'unfollows the other user and returns true' do
        expect(chris.following? martin).to be_truthy
        expect(chris.unfollow! martin).to be_truthy
        expect(chris.following? martin).to be_falsey
      end
    end

    context 'when a user starts following another' do
      it 'creates active and passive relationship' do
        expect(chris.following? martin).to be_falsey
        expect(martin.following? chris).to be_falsey

        chris.follow! martin

        expect(chris.following? martin).to be_truthy
        expect(martin.following? chris).to be_falsey
        expect(martin.followers.include? chris).to be_truthy
      end
    end
  end
end

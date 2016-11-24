require 'rails_helper'

describe User do
  
  subject(:user) { create :user }
  
  describe 'attributes' do
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :username }
    it { is_expected.to respond_to :first_name }
    it { is_expected.to respond_to :last_name }
    it { is_expected.to respond_to :email }
    it { is_expected.to respond_to :admin }
    it { is_expected.to respond_to :meetings }
    it { is_expected.to respond_to :talks }
    it { is_expected.to respond_to :favorites }
    it { is_expected.to respond_to :favorites_count }
    it { is_expected.to respond_to :favorite_talks }
    it { is_expected.to respond_to :favorite? }
  end

  describe 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of :username }
  end

  describe 'favorite!' do
    let(:talk) { create :talk }        
    before { user.favorite!(talk) }
    it { is_expected.to be_favorite(talk) }

    describe 'and unfavorite!' do
      before { user.unfavorite!(talk) }
      it { is_expected.to_not be_favorite(talk) }
    end
  end

  describe 'following users' do
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

  describe '#speaker?' do
    context 'when user has given a talk' do
      subject(:user) { create :user, talks: create_list(:talk, 5) }
      it { is_expected.to be_a_speaker }
    end

    context 'when user has not given a talk' do
      it { is_expected.to_not be_a_speaker }
    end
  end
end

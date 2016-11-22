require 'rails_helper'

RSpec.describe Meeting, type: :model do
  describe 'Attributes' do
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :date }
    it { is_expected.to respond_to :title }
    it { is_expected.to respond_to :location }
    it { is_expected.to respond_to :user_id }
  end

  describe 'Validations' do
    context 'valid meeting' do
      let(:user) { create(:user) }
      subject(:meeting) { build(:meeting, user: user) }

      it { is_expected.to be_valid }
      it { is_expected.to validate_presence_of :date }
      it { is_expected.to validate_presence_of :title }
      it { is_expected.to validate_presence_of :location }
      it { is_expected.to validate_presence_of :user }
    end
  end
end

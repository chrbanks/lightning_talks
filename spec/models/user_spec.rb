require 'rails_helper'

RSpec.describe User, type: :model do
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
      subject(:user) { build(:user) }

      it { is_expected.to be_valid }
      it { is_expected.to validate_presence_of :username }
    end
  end
end

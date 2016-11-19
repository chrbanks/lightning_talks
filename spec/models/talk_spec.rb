require 'rails_helper'

RSpec.describe Talk, type: :model do
  describe 'Attributes' do
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :title }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :user_id }
    it { is_expected.to respond_to :meeting_id }
    it { is_expected.to respond_to :category }
  end

  describe 'Validations' do
    context 'valid talk' do
      let(:user) { build :user }
      let(:meeting) { build :meeting, user: user }
      subject(:talk) { build :talk, user: user, meeting: meeting }

      it { is_expected.to be_valid }
      it { is_expected.to validate_presence_of :title }
      it { is_expected.to validate_presence_of :description }
      it { is_expected.to validate_inclusion_of(:category).in_array(
        %w(mobile developer_tools design front_end database learning news)) }
    end
  end
end

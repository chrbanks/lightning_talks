require 'rails_helper'

describe Talk do

  subject(:talk) { create :talk }

  describe 'attributes' do
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :title }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :user_id }
    it { is_expected.to respond_to :meeting_id }
    it { is_expected.to respond_to :category }
    it { is_expected.to respond_to :comments_count }
  end

  describe 'validations' do    
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_inclusion_of(:category).in_array(
      %w(mobile developer_tools design front_end database learning news)) }
    it { is_expected.to validate_presence_of :meeting }
    it { is_expected.to validate_presence_of :user }
  end

  describe '#next and #previous' do
    let(:meeting) { create :meeting, talks: create_list(:talk, 5) }
    let(:first) { meeting.talks.first }
    let(:second) { meeting.talks.second }
    let(:last) { meeting.talks.last }

    it 'returns the next talk for that meeting' do
      expect(first.next).to eq second
    end

    it 'returns nil if this is the last talk' do
      expect(last.next).to eq nil
    end

    it 'returns the previous talk for that meeting' do
      expect(second.previous).to eq first
    end

    it 'returns nil if this is the first talk' do
      expect(first.previous).to eq nil
    end
  end
end

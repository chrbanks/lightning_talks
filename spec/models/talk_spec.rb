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
    it { is_expected.to respond_to :favorites_count }
    it { is_expected.to respond_to :favorites }
    it { is_expected.to respond_to :overview }
    it { is_expected.to respond_to :tags }
  end

  describe 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_inclusion_of(:category).in_array(
      %w(agile developer_tools design front_end database learning news miscellaneous)) }
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

  describe 'popularity' do

    context 'when talk has at least 5 favorites' do
      subject(:talk) { create :talk, favorites_count: 5 }
      it { is_expected.to be_popular }
    end

    context 'when talk has less than 5 favorites' do
      subject(:talk) { create :talk, favorites_count: 4 }
      it { is_expected.to_not be_popular }
    end
  end

  describe '.upcoming' do
    let(:talk) { create :talk, meeting: meeting }

    context 'when talk occurs today' do
      let(:meeting) { create :meeting, date: Date.today }
      it 'includes talk' do
        expect(Talk.upcoming).to include talk
      end
    end

    context 'when talk occurs after today' do
      let(:meeting) { create :meeting, date: Date.tomorrow }
      it 'includes talk' do
        expect(Talk.upcoming).to include talk
      end
    end

    context 'when talk occurs in the past' do
      let(:meeting) { create :meeting, date: Date.yesterday }
      it 'excludes talk' do
        expect(Talk.upcoming).to_not include talk
      end
    end
  end

  describe '.recent' do
    let(:talk) { create :talk, meeting: meeting }

    context 'when talk occurs today' do
      let(:meeting) { create :meeting, date: Date.today }
      it 'excludes talk' do
        expect(Talk.recent).to_not include talk
      end
    end

    context 'when talk occurs after today' do
      let(:meeting) { create :meeting, date: Date.tomorrow }
      it 'excludes talk' do
        expect(Talk.recent).to_not include talk
      end
    end

    context 'when talk occurs in the past' do
      let(:meeting) { create :meeting, date: Date.yesterday }
      it 'includes talk' do
        expect(Talk.recent).to include talk
      end
    end
  end
end

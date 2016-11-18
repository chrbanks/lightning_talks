require 'rails_helper'

describe Monogram do
  include ActionView::TestCase::Behavior
  
  describe '#initials' do
    
    subject(:avatar) { Monogram.new(user, view) }
    
    context 'with one word' do
      let(:user) { build :user, first_name: 'Foo' }
      subject(:avatar) { Monogram.new(user, view) }

      it { expect(avatar.initials).to eq 'F' }
    end

    context 'with two words' do
      let(:user) { build :user, first_name: 'Foo', last_name: 'Bar' }

      it { expect(avatar.initials).to eq 'FB' }
    end

    context 'with more than two words' do
      let(:user) { build :user, first_name: 'Foo Bar', last_name: 'Chicken' }

      it { expect(avatar.initials).to eq 'FB' }
    end
  end

  describe '#fill' do

    let(:user) { build :user, first_name: 'Foo' }
    let(:other_user) { build :user, first_name: 'Bar' }
    let(:fill) { Monogram.new(user, view).fill }
    let(:fill_second_time) { Monogram.new(user, view).fill }
    let(:fill_for_other_name) { Monogram.new(other_user, view).fill }

    it 'returns the same fill each time' do
      expect(fill).to eq fill_second_time
    end

    it 'returns different fill based on name' do
      expect(fill).to_not eq fill_for_other_name
    end
  end
end

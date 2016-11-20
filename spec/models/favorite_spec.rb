require 'rails_helper'

describe Favorite do
  
  subject(:favorite) { create :favorite }

  describe 'attributes' do
    it { is_expected.to respond_to :talk }
    it { is_expected.to respond_to :user }
  end
end

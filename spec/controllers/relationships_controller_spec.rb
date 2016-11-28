require 'spec_helper'

describe RelationshipsController do

  let(:user) { create :user }
  let(:other_user) { create :user }

  before { mock_sign_in user }

  describe "creating a relationship with Ajax" do

    let(:params) do
      { relationship: { followed_id: other_user.id } }
    end

    it "should increment the Relationship count" do
      expect do
        post :create, xhr: true, params: params
      end.to change(Relationship, :count).by(1)
    end

    it "should respond with success" do
      post :create, xhr: true, params: params
      expect(response).to be_success
    end
  end

  describe "destroying a relationship with Ajax" do

    before { user.follow!(other_user) }
    let(:relationship) { user.active_relationships.find_by_followed_id(other_user) }
    let(:params) do 
      { id: relationship.id }
    end
    
    it "should decrement the Relationship count" do
      expect do
        delete :destroy, xhr: true, params: params
      end.to change(Relationship, :count).by(-1)
    end

    it "should respond with success" do
      delete :destroy, xhr: true, params: params
      expect(response).to be_success
    end
  end
end
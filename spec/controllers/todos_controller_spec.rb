require 'rails_helper'

RSpec.describe TodosController, type: :controller do

	let(:valid_attributes) {
    attributes_for(:user)
  }

  let(:invalid_attributes) {
    attributes_for(:user, username: nil)
  }

  let(:valid_session) { {} }

  before(:each) do
    login_user
  end

  describe "Visita usuários" do
    it "verifica TODO de de todos usuários" do
      user = User.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:users)).to eq(User.all)
    end
  end

end

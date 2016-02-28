require 'rails_helper'

RSpec.describe UsersController, type: :controller do

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

  describe "Verifica usuários" do
    it "assigns all users as @users" do
      user = User.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:users)).to eq(User.all)
    end
  end

  describe "Verifica detalhes do usuários" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      get :show, {:id => user.to_param}, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "Cria um novo usuário" do
    it "assigns a new user as @user" do
      get :new, {}, valid_session
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "Edita um usuário" do
    it "verifica se a requisição está indo para editar usuário" do
      user = User.create! valid_attributes
      get :edit, {:id => user.to_param}, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "Verifica persistencia de um novo usuário" do
    context "valida parâmetros válidos" do
      it "cria um novo usuário" do
        expect {
          post :create, {:user => valid_attributes}, valid_session
        }.to change(User, :count).by(1)
      end

      it "verifica persistencia do usuário" do
        post :create, {:user => valid_attributes}, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "redireciona para usuário criado" do
        post :create, {:user => valid_attributes}, valid_session
        expect(response).to redirect_to(User.last)
      end
    end
  end

  describe "Edição do usuário" do
    context "validação de parametros" do
      let(:new_attributes) {
        skip("Adicionar um hash para a model")
      }

      it "update de um usuário selecionado" do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => new_attributes}, valid_session
        user.reload
        skip("estado do usuário")
      end
    end
  end

  describe "Detela o usuário" do
    it "deleta o usuário selecionado" do
      user = User.create! valid_attributes
      expect {
        delete :destroy, {:id => user.to_param}, valid_session
      }.to change(User, :count).by(-1)
    end

    it "redireciona para a lista de usuários" do
      user = User.create! valid_attributes
      delete :destroy, {:id => user.to_param}, valid_session
      expect(response).to redirect_to(users_url)
    end
  end


end

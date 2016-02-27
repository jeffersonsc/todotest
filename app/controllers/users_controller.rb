class UsersController < ApplicationController
  before_filter :user_admin!
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "Usuário criado com sucesso!"
  		redirect_to users_url 
  	else
  		render :new
  	end
  end

  def edit
  end

  def show
  	
  end

  def update
  	if @user.update(user_params)
  		flash[:notice] = "Usuário alterado com sucesso!"
  		redirect_to users_url
  	else
  		render :edit
  	end
  end

  def destroy
  	if @user.destroy
  		flash[:notice] = "Usuário removido com sucesso!"
  	else
  		flash[:error] = "Não foi possível remover este usuário."
  	end
  	redirect_to users_url
  end

  private

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :username, :email, :birth_date, :admin, :password)
  end

  def set_user
  	@user = User.find(params[:id])
  end
end

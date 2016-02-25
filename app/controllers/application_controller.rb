class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def user_admin!
    user_admin? unless current_user.admin == true
  end

  def user_admin?
    redirect_to root_path, alert: 'Você não tem acesso para esse recurso, solicite premissão ao administrador'
  end
end

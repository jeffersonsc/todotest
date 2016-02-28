module DeviseHelper
  include Devise::TestHelpers

  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user] if @request
    @user = create(:user)
    sign_in @user
  end

  def sign_in_user
    @user = create(:user)
    post_via_redirect user_session_path, 'user[username]' => @user.username, 'user[password]' => @user.password
  end

end
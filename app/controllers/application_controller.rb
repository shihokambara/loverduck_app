class ApplicationController < ActionController::API
  def authenticate
      auth_user = User.find_by(access_token: params[:access_token])
      auth_user != nil ? true : false
  end

  def current_user
      auth_user = User.find_by(access_token: params[:access_token])
      return auth_user
  end
end

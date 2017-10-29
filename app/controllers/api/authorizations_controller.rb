module Api
  class AuthorizationsController < ApiController
   # include ActionController::HttpAuthentication::Token::ControllerMethods
    before_action :authenticate, only: [:profile, :edit_password]


    def signup
      user = User.create!(mail: params[:mail], password: params[:password], name: params[:name], tel: params[:tel])
      data = { "access_token": user.access_token }
      render json: data
    end

    def signin
      user = User.where(mail: params[:mail], password: params[:password]).first
      data = { "access_token": user.access_token }
      if user.present?
        render json: data
      else
        render_unauthorized
      end
    end

    def profile
    end

    def edit

    end

    def edit_password
      if current_user.password == params[:old_password]
        current_user.update(password: params[:new_password])
        data = { "messages": 'ok' }
        render json: data
      else
        render_unauthorized
      end
    end

    protected

    def render_unauthorized
      # render_errors(:unauthorized, ['invalid token'])
      obj = { message: 'token invalid' }
      render json: obj, status: :unauthorized
    end



  end
end
 

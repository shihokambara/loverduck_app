module Api
  class AuthorizationsController < ApiController
   # include ActionController::HttpAuthentication::Token::ControllerMethods
    before_action :authenticate, only: [:profile, :edit_password]


    def signup
      data = params[:data]
      user = User.create!(mail: data[:mail], password: data[:password], name: data[:name], tel: data[:tel])
      token = { "access_token": user.access_token }
      render json: token
    end

    def signin
      data = params[:data]
      if data.present?
        user = User.where(mail: data[:mail], password: data[:password]).first
        token = { "access_token": user.access_token }
        if user.present?
          render json: token
        else
          render json: { "message": 'email or password invalid' }
        end
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

  end
end
 

module Api
  class AuthorizationsController < ApiController
    include ActionController::HttpAuthentication::Token::ControllerMethods
    before_action :authenticate, only: [:profile, :edit]


    def signup
      User.create(email: params[:mail], password: params[:password], name: params[:name], tel: params[:tel])
      return { "access_token": "asdkfaslfdkaslfds" }
    end

    def signin
      #sign in
    end

    def profile
    end

    def edit
    end

    protected

    def authenticate
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      authenticate_with_http_token do |token, options|
        token == 'FOO'
      end
    end

    def render_unauthorized
      # render_errors(:unauthorized, ['invalid token'])
      obj = { message: 'token invalid' }
      render json: obj, status: :unauthorized
    end


  end
end
 

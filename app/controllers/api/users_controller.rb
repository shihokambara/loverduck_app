module Api

  class UsersController < ApiController
    before_action :authenticate_user!, only: [:edit]
    before_action :set_user, only: [:edit]

    def create
      puts 'create was called'
    end

    def edit
    end

    def destroy
    end

    def profile
      render json: {
        data: {
          mail: current_user.email,
          user: current_user.username,
          tel: current_user.tel
        }
      }, status: 200
    end

    private

    def set_user
      @user = User.find_by(id: params[:])
      if @user == nil
        redirect_to root_path(notice: "ユーザーが存在しません")
      end
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

  end
end

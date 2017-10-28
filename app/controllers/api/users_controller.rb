module Api

  class UsersController < ApiController
    before_action :set_user, only: [:edit]

    def create
      puts 'create was called'
    end

    def edit
    end

    def destroy
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

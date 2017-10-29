module Api
  class DucksController < ApiController
    before_action :authenticate

    def edit
    end

    def create
      duck = Duck.create(unique_id: params[:unique_id], postal_code: params[:postal_code], address: params[:address], password: params[:password], name: params[:name])
      UserDuck.create(duck_id: duck.id, user_id: current_user.id)
      render json: {
        data: {
          message: "OK",
        }
      }, status: 200
    end

    def register
      UserDuck.create(user_id: current_user.id, duck_id: params[:duck_id])
    end

    def list
      @ducks = current_user.ducks
    end

    def detail
      duck = Duck.find(params[:duck_id])
      @daily_logs = duck.daily_logs
    end

    def deilylog
    end

    def update_alertlog
    end

    def alertlog
      duck = Duck.find(params[:duck_id])
      @alert_logs = duck.alerts
    end

    def reaction_log
    end

  end
end

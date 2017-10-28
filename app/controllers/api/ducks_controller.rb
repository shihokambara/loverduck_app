module Api
  class DucksController < ApiController
    before_action :authenticate_user!

    def edit
    end

    def create
      Duck.create(unique_id: params[:unique_id], postal_code: params[:postal_code], address: params[:address], password: params[:password], name: params[:name])
      render json: {
        data: {
          message: "OK",
        }
      }, status: 200
    end

    def register
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
      Duck = params[:duck_id]
      @daily_logs = duck.alerts
    end

    def reaction_log
    end

  end
end
 

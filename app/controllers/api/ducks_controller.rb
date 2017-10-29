module Api
  class DucksController < ApiController
    before_action :authenticate

    def edit
    end

    def create
      data = params[:data]
      if data.present?
      duck = Duck.create(unique_id: data[:unique_id], postal_code: data[:postal_code], address: data[:address], password: data[:password], name: data[:name])
      UserDuck.create(duck_id: duck.id, user_id: current_user.id)
      render_ok
      else
        return_error
      end
    end

    def register
      data = params[:data]
      UserDuck.create(user_id: current_user.id, duck_id: data[:duck_id])
    end

    def list
      if current_user.present?
        @ducks = current_user.ducks
      else
        return_error
      end
    end

    def detail
      data = params[:data]
      if data.present?
        duck = Duck.find(data[:duck_id])
        @daily_logs = duck.daily_logs
      else
        return_error
      end
    end

    def deilylog
    end

    def update_alertlog
    end

    def alertlog
      data = params[:data]
      duck = Duck.find(data[:duck_id])
      @alert_logs = duck.alerts
    end

    def reaction_log
    end

  end
end

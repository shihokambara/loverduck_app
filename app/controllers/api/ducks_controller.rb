module Api
  class DucksController < ApiController
    before_action :authenticate

    def edit
    end

    def create
      duck = Duck.create(unique_id: params[:unique_id], postal_code: params[:postal_code], address: params[:address], password: params[:password], name: params[:name])
      UserDuck.create(duck_id: duck.id, user_id: current_user.id)
      render_ok
    end

    def register
      UserDuck.create(user_id: current_user.id, duck_id: params[:duck_id])
    end

    def list
      puts current_user
      if current_user.present?
        @ducks = current_user.ducks
        render 'list', formats: 'json', handlers: 'jbuilder'
      else
        return_error
      end
    end

    def detail
        duck = Duck.find(params[:duck_id])
        @daily_logs = duck.daily_logs
        render 'details', formats: 'json', handlers: 'jbuilder'
    end

    def deilylog
    end

    def update_alertlog
    end

    def alertlog
      duck = Duck.find(params[:duck_id])
      @alert_logs = duck.alerts
      render 'alertlog', formats: 'json', handlers: 'jbuilder'
    end

    def reaction_log
    end

  end
end

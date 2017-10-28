class AlertsController < ApplicationController
  def start_call
    tel='+819072792373'
    begin
      account_id = "ACdd2768539e44741e44bb35c23cfa78d0"
      auth_token = ENV["AUTH_TOKEN"]
      client = Twilio::REST::Client.new(account_id, auth_token)
      client.account.calls.create(
        from: "+815031961573",
        to: tel,
        url: "https://loverduck.herokuapp.com/calling",
        method: "GET"
      )
    rescue Twilio::REST::RequestError => e
      puts e
    end
  end

   def index
    response = Twilio::TwiML::Response.new do |r|　#TwiMLを作成するためのモジュール
      r.Say "It's alert", voice: 'alice'
    end
    render :xml => response.text
  end

   def calling
     render file: 'public/calling.xml', status: 200, layout: false
   end

end

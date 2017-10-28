class AlertsController < ApplicationController
  def start_call(tel='+819072792373') 
    begin
      account_id = "ACdd2768539e44741e44bb35c23cfa78d0"
      auth_token = ENV["AUTH_TOKEN"]
      client = Twilio::REST::Client.new(account_id, auth_token)
      client.account.calls.create(
        from: "+815031961573",
        to: tel,  #"+81",
        url: "http://75d2c7ab.ngrok.com/dial",　#ここは自分が取得したurl（後ほど解説）
        method: "GET",　#デフォルトはpostなのでgetを指定
      )

   #error handling
   rescue Twilio::REST::RequestError => e
      puts e.message
   end
   redirect_to action: :index
  end

   def index
    response = Twilio::TwiML::Response.new do |r|　#TwiMLを作成するためのモジュール
      r.Say '緊急通知', voice: 'alice'
    end
    render :xml => response.text
  end
end

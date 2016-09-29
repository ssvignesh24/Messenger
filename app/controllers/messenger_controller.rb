require "lib.rb"
class MessengerController < ApplicationController
  protect_from_forgery with: :null_session
  rescue_from "MessageException", with: :fall_back

  def create
    user = User.create name: user_params[:name], mobile: user_params[:mobile]
    @token = Device.build user
  end

  def send_message

    from_user = user_from_device
    to_user = User.find msg_params[:to_user]
    if from_user && to_user
      @message = Message.create from: from_user, to: to_user, message: msg_params[:message]
    else
      raise MessageException.new "Cant find users", 1 
    end
  end

  def fetch
    user = user_from_device
    @messages = Message.where(to: user, read: false).includes(:from)
  end

  private
    def fall_back
      respond_to do |format|
        format.json { render :json => {status: false} }
      end
    end

    def msg_params
      params.require(:message).permit(:message, :to_user)
    end

    def user_params
      params.require(:user).permit(:name, :mobile)
    end

    def user_from_device
      device = Device.where(token: params["user_token"]).first
      if device.nil?
        raise MessageException.new "Cant find user", 1 
      else
        device.user
      end
    end
end

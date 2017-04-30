
class MessagesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Message sent!"
      redirect_to root_path
    else
      flash[:alert] = "Error sending message!"
      redirect_to root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:first_name, :last_name, :email, :subject, :message)
  end

end

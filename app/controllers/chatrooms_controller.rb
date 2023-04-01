class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end

  def show
    investor = Investor.find(params[:investor_id])
    @chatroom = Chatroom.find_or_create_by(investor: investor, name: investor.first_name)
    # raise
    @message = Message.new
  end
end

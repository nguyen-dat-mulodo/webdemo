class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    rooms = Room.all
  end

  def show
    $room = Room.find_by_id!(params[:id])
    @messages = $room.messages.all
  end

  def new
  end

  def create
    @room = Room.new(room_params)
    @room.save!
    # @room = Room.create room_name: 'chat', room_user: current_user
  end
  private
    def room_params
      params.require(:room).permit(:room_name)
    end
end

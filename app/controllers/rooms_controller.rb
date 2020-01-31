class RoomsController < ApplicationController
  before_action :load_entities

  def index
    @room = Room.all
  end

  def show
    @room_message = RoomMessage.new room: @room 
    @room_messages = @room.room_messages.includes(:user) 
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new permitted_params
    if @room.save
      flash[:success] = "Room #{@room.name} created Successfully"
      redirect_to rooms_path
    else
      flash[:error] = @room.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update_attributes(permitted_params)
      flash[:success] = "Room #{@room.name} updated Successfully"
      redirect_to rooms_path
    else
      flash[:error] = @room.errors.full_messages
      render :edit
    end
  end

  protected

  def load_entities
    @rooms = Room.all
    @room = Room.find(params[:id]) if params[:id]
  end
    
  def permitted_params
    params.require(:room).permit(:name)
  end

end

class DmRoomsController < ApplicationController
  before_action :login_required

  def create
    @dm_room = DmRoom.create
    @dm_entry1 = DmEntry.create(dm_room_id: @dm_room.id, user_id: current_user.id)
    @dm_entry2 = DmEntry.create(params.require(:dm_entry).permit(:user_id, :dm_room_id).merge(dm_room_id: @dm_room.id))
    redirect_to "/dm_rooms/#{@dm_room.id}"
  end

  def show
    @dm_room = DmRoom.find(params[:id])
    if DmEntry.where(user_id: current_user.id, dm_room_id: @dm_room.id).present?
      @dm_messages = @dm_room.dm_messages.includes(:user)
      @dm_message = DmMessage.new
      @dm_entries = @dm_room.dm_entries.includes(:user)
    else
      redirect_back(fallback_location: root_path)
    end
  end
end

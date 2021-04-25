class DmMessagesController < ApplicationController
  before_action :login_required

  def create
    if DmEntry.where(user_id: current_user.id, dm_room_id: params[:dm_message][:dm_room_id]).present?
      @dm_message = DmMessage.create(params.require(:dm_message).permit(:user_id, :content, :dm_room_id).merge(user_id: current_user.id))
      redirect_to "/dm_rooms/#{@dm_message.dm_room_id}"
    else
      redirect_back(fallback_location: root_path)
    end
  end
end

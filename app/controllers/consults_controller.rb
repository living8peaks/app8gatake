class ConsultsController < ApplicationController
  before_action :login_required

  def index
    #@favorite_user = Favorite.where(checked: true)
    #@consults_users = Favorite.where(user_id: current_user.id)
    #lend_farmland = LendFarmland.where.not(user_id: current_user.id)
    #farmland_user = User.joins(:lend_farmlands).where.not(id: current_user.id)
    @consults_users = User.where.not(lend_faramland_id: current_user.id)

  end

  def create
    current_user_chat_rooms = ChatRoomUser.where(user_id: current_user.id).map(&:chat_room)
    chat_room = ChatRoomUser.where(chat_room: current_user_chat_rooms, user_id: params[:user_id]).map(&:chat_room).first
    if chat_room.blank?
      chat_room = ChatRoom.create
      ChatRoomUser.create(chat_room: chat_room, user_id: current_user.id)
      ChatRoomUser.create(chat_room: chat_room, user_id: params[:user_id])
    end
    redirect_to action: :show, id: chat_room.id
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
    @chat_room_user = @chat_room.chat_room_users.where.not(user_id: current_user.id).first.user
    @chat_messages = ChatMessage.where(chat_room: @chat_room)
  end
end

class NotificationsController < ApplicationController
  before_action :login_required

  def index
    # @notification = Notification.find(params[:id])
    @notifications = current_user.passive_notifications.page(params[:page]).per(10)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
    #@ = @chat_room.chat_room_users.where.not(user_id: current_user.id).first.user
  end
end

class NotificationsController < ApplicationController
  before_action :login_required

  def index
    @notifications = current_user.passive_notifications.where.not(visitor_id: current_user.id).where(checked: false).page(params[:page]).per(10)
  end

  def update
    if current_user.passive_notifications.update_all(checked: true)
      redirect_to root_path
    end
  end
end


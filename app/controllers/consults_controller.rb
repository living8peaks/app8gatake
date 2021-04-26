class ConsultsController < ApplicationController
  before_action :login_required

  def index
    @consults = current_user && LendFarmland.where.not(user_id: current_user.id).where("id = ?", "params[id]")
  end
end

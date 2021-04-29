class ConsultsController < ApplicationController
  before_action :login_required

  def index
    @consults = current_user.following
  end
end

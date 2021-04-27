class MatchingController < ApplicationController
  before_action :login_required

  def index
    @match_users = current_user.following && current_user.followers if logged_in?
  end
end

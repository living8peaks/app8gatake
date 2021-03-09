class PostsController < ApplicationController
  before_action :login_required, only: %i[create, destroy]

  def create
  
  end

  def destroy
  
  end
end

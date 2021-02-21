class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(
        :nonscreen_last_name,
        :nonscreen_first_name,
        :name,
        :email,
        :password,
        :password_confirmation,
        :gender_identities,
        :birthday,
        :address,
        :self_info,
      )
    end
end


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
      log_in @user
      flash[:success] = "#{@user.name}さんのアカウントを作成しました"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

   def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'アカウント情報を変更しました'
      redirect_to @user
    else
      render 'edit'
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


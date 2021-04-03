class UsersController < ApplicationController
  protect_from_forgery
  before_action :login_required,
  only: %i[index show edit update destroy withdrawal_confirmation withdrawal_destroy following followers]
  before_action :correct_user,
  only: %i[edit update withdrawal_confirmation withdrawal_destroy]
  before_action :admin_user, only: :destroy

  def index
    @users = User.page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @lend_farmlands = @user.microposts.page(params[:page]).per(5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.avatar.attach(params[:user][:avatar])
    if @user.save
      @user.send_activation_email
      flash[:info] = 'アカウントの有効化のためのメールを送信しましたので、ご登録のメールアドレスをご確認ください'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

   def update
    @user = User.find(params[:id])
    @user.avatar.attach(params[:user][:avatar])
    if @user.update(user_params)
      flash[:success] = 'アカウント情報を変更しました'
      redirect_to @user
    else
      render 'edit'
    end
   end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'ユーザーを削除しました'
    redirect_to users_path
  end

  def withdrawal_confirmation
    @user = User.find(params[:id])
  end

  def withdrawal_destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = '退会処理が完了しました'
    redirect_to root_path
  end

  def following
    @title = 'フォロー中のユーザー'
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(20)
    render 'show_follow'
  end

  def followers
    @title = 'フォローされているユーザー'
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(20)
    render 'show_follow'
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
        :avatar,
      )
    end

    # ユーザーが自分の情報だけを編集できるようにするため
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end


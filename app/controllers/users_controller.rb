class UsersController < ApplicationController
  before_action :login_required,
  only: %i[index show edit update destroy withdrawal_confirmation withdrawal_destroy]
  before_action :correct_user,
  only: %i[edit update withdrawal_confirmation withdrawal_destroy]
  before_action :admin_user, only: :destroy

  def index
    @users = User.page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
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

    # ログインしていないユーザーが保護されたページにアクセスできないようにするため
    def login_required
      unless logged_in?
        store_location
        flash[:danger] = 'ログインしてください'
        redirect_to login_url
      end
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


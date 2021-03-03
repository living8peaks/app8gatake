class PasswordResetsController < ApplicationController
  before_action :get_user,   only: %i[edit update]
  before_action :valid_user, only: %i[edit update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = 'パスワードを再設定するためのメールを送信しました。ご登録のメールアドレスをご確認ください。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ご入力されたメールアドレスは登録されていません。誤りがないかご確認ください。'
      render 'new'
    end
  end

  def edit
  end

  private

    def get_user
      @user = User.find_by(email: params[:email])
    end

    def valid_user
      unless(@user && @user.activated? && @user.authenticated?(:reset, params[:id]))
        redirect_to root_path
      end
    end
end

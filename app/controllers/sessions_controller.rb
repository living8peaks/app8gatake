class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      remember user
      redirect_to user
    else
      flash.now[:danger] = 'メールアドレスとパスワードの組み合わせが正しくありません'
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end

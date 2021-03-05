class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = 'アカウントの作成が完了しました！'
      redirect_to user
    else
      flash[:danger] = 'アカウントの有効化ができませんでした'
      redirect_to root_path
    end
  end
end

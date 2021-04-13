class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      if user.activated?
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
<<<<<<< HEAD
      redirect_to root_path
=======
      redirect_back_or user
>>>>>>> master
      else
        message = <<~TEXT
          ようこそ、#{@user.name}さん!
          すみませんが、アカウントの有効化ができませんでした。
          アカウント作成の際にご登録いただいたメールアドレスに、
          アカウント有効化用のメールが送信されています。
          そこにあるリンクからアカウントの有効化を行ってください。
        TEXT
        flash[:warning] = message
        redirect_to root_path
      end
    else
      flash.now[:danger] = 'メールアドレスとパスワードの組み合わせが正しくありません'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end

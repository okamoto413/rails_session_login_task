class SessionsController < ApplicationController
   skip_before_action :login_required, only: [:new, :create] 
   
  def new
  end

  #ログイン成功/失敗した場合
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      flash[:success] = "ログインしました"
      log_in(user)
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードに誤りがあります'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end

end

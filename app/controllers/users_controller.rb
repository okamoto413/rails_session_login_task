class UsersController < ApplicationController
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :login_required, only: [:new, :create]
    
  def new
    @user = User.new
  end

  #アカウントを登録する
  def create
    @user = User.new(user_params)
    if @user.save
       # アカウント登録が成功したらセッションにユーザーIDを保存し、ログインする
      redirect_to @user
      session[:user_id] = @user.id
      flash[:success] = "アカウントを登録しました"
    else
      render :new
    end
  end

  #アカウントを編集する
  def edit
  end

  #アカウント詳細画面
  def show
  end  

  #アカウントを更新する
  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:success] = "アカウントを更新しました"
    else
      render :edit
    end
  end

  #アカウント削除する
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to new_session_path(@user.id)
  end  

  private

  #アカウント
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to current_user unless current_user?(@user)
  end
end

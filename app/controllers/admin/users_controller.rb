class Admin::UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :admin_user,     only: [:destroy]

  def index
    @users = User.includes(:tasks).page(params[:page])
  end

  def new
    if params[:back]
      @user = User.new(user_params)
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_path(@user), notice: 'ユーザーを作成しました'
    else
      render 'new'
    end
  end

  def show
    @tasks = @user.tasks.page(params[:page])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: 'ユーザーを編集しました'
    else
      render 'edit'
    end
  end

  def destroy
    if current_user.id != @user.id && @user.destroy
      redirect_to admin_users_path, notice: 'ユーザーを削除しました'
    else
      redirect_to admin_users_path, alert: 'ユーザーの削除に失敗しました'
    end
  end

  

  private
  def set_user
    @user = User.find(params[:id])
  end

 def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
 end
 
 
 def require_admin
     if !current_user.admin?
           redirect_to benefits_path
     end
 end
end
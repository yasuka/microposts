class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :correct_user!, only: [:edit, :update]
  
  
  def show
  end
  
  def new
    @user = User.new
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to @user , notice: 'プロフィール内容を編集しました'
    else
      render 'edit'
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "登録ありがとうございます"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :area, :password,
                                 :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def correct_user!
    redirect_to(root_url, alert: "不正なアクセスはやめてください！") unless @user == current_user
  end
end

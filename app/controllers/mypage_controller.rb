class MypageController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def edit
    unless @user == current_user
      redirect_to mypage_users_path(@user)
    end
  end
  
  def update
    if @user.update(user_params)
      redirect_to mypage_users_path(current_user)
    else
      render :edit
    end
  end
  
  def mypage
    @user = current_user
  end
  
  private
    def set_user
      @user = current_user
    end
  
    def user_params
      params.require(:user).permit(:humanType, :email, :password, :password_confirmation, :name, :graduateYear, :university, :industry, :companyScale, :selfPR)
    end
end

class MypageController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def edit
  end
  
  def update
    @user.update_without_current_password(user_params)
    redirect_to mypage_mypage_url
  end
  
  def mypage
  end
  
  private
    def set_user
      @user = current_user
    end
  
    def user_params
      params.permit(:humanType, :email, :password, :password_confirmation, :name, :graduateYear, :university, :industry, :companyScale, :selfPR)
    end
end

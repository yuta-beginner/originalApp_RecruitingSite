class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # サインアップ時にhumanTypeのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:humanType])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:humanType, :name, :graduateYear, :university, :industry, :companyScale, :selfPR, :image, :movie])
  end
end

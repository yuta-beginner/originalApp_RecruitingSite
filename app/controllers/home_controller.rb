class HomeController < ApplicationController
    def index
        redirect_to mypage_users_path if user_signed_in?
    end
end

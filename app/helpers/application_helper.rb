module ApplicationHelper
    def bs4_bgcolor_for(flash_key)
        case flash_key
        when "success"
            "alert-success"
        when "error"
            "alert-danger"
        when "alert"
            "alert-warning"
        when "notice" 
            "alert-info"
        else
            flash_key.to_s
        end
    end
    def resource_name
        :user
    end
    def resource
        @resource ||= User.new
    end
     
    def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
    end
    def log_in(user)
        session[:user_id] = user.id
    end
end

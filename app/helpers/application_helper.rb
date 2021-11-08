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
    def sidebar_link_item(name, path)
        class_name = 'channel'
        class_name << ' active' if current_page?(path)
    
        content_tag :li, class:class_name do
          link_to name, path, class: 'channel_name'
        end
    end
end

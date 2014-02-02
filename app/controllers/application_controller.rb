class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    private

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def require_login
      unless current_user
        redirect_to root_url, :notice => "You must be logged in to access this page."
        return false
      end
    end

    def flash_class(level)
        case level
        when :notice then "info"
        when :error then "error"
        when :alert then "warning"
        end
    end

    helper_method :current_user, :flash_class, :require_login
end

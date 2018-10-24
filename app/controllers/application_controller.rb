class ApplicationController < ActionController::Base
    before_action :authorize_access


    private

    def authorize_access
        unless current_user.subscriber?
            redirect_to new_subscription_path, notice: 'You are not authorized to enter, please purchase a subscription'
        end
    end
end

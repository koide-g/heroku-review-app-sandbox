class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :multiple_authenticate
  
  
  protected

  def multiple_authenticate
    authenticate_or_request_with_http_basic do |username, password|
      (
        ActiveSupport::SecurityUtils.secure_compare(username, 'user1') &
        ActiveSupport::SecurityUtils.secure_compare(password, 'pass1')
      ) | (
        ActiveSupport::SecurityUtils.secure_compare(username, 'user2') &
        ActiveSupport::SecurityUtils.secure_compare(password, 'pass2')
      )
    end
  end
end

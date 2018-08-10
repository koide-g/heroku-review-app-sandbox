class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :multiple_authenticate
  
  protected

  def multiple_authenticate
    # ENV['BASIC_AUTH_PAIRS']
    # => user1:password1,user2:password2,user3:password3
    return true if ENV['BASIC_AUTH_PAIRS'].nil?
    authenticate_or_request_with_http_basic do |username, password|
      
      ENV['BASIC_AUTH_PAIRS'].split(',')
        .map { |x| x.split(':') }
        .map { |user, passwd|
         ActiveSupport::SecurityUtils.secure_compare(username, user) &
         ActiveSupport::SecurityUtils.secure_compare(password, passwd)
        }
        .any?
    end
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter:set_user
  
  def set_user
	@user_id = request.session_options[:id]
  end
  
end

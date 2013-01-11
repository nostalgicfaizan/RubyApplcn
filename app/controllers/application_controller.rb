class ApplicationController < ActionController::Base
  protect_from_forgery

   rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  
end
  
  before_filter :authenticate_member! 
def current_ability
   @current_ability ||= Ability.new(current_member)
end
end
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login  

  private
  def not_authenticated
    flash[:warning] = 'Tienes que Autenticarte!!'
    redirect_to log_in_path
  end
end

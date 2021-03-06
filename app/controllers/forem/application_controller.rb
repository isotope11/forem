class Forem::ApplicationController < ApplicationController
  
  private
  
  def authenticate_forem_user
    if !current_user
      session[:return_to] = request.fullpath
      flash[:error] = t("forem.errors.not_signed_in")
      redirect_to main_app.sign_in_path
    end
  end
  
  def forem_admin?
    current_user && current_user.forem_admin?
  end
  helper_method :forem_admin?

end

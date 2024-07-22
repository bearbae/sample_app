class ApplicationController < ActionController::Base
  include SessionsHelper
  include Pagy::Backend

  private
  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t("controller.please")
    redirect_to login_url
  end
end

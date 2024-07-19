class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by email: params[:email]
    if user && !user.activated && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = t("controller.account_active")
      redirect_to user
    else
      lash[:danger] = t("controller.invalid_account")
      redirect_to root_url
    end
  end
end

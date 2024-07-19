class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t("mailers.subject")
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: t("mailers.password_resert")
  end
end

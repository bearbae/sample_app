class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t("mailers.subject")
  end

  def password_reset
    @greeting = "Hi"

    mail to: t("mailers.mail_to")
  end
end

class User < ApplicationRecord
  before_save :downcase_email

  validates :name, presence: true, length: {maximum: Settings::NAME}
  validates :email, presence: true, length: {maximum: Settings::EMAIL},
                    format: {with: Settings::VALID_EMAIL_REGEX},
                    uniqueness: true

  has_secure_password

  private

  def downcase_email
    email.downcase!
  end
end

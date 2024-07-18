class User < ApplicationRecord
  before_save :downcase_email
  scope :sorted_by_created_at, -> { order(created_at: :asc) }

  validates :name, presence: true, length: {maximum: Settings.digit_50}
  validates :email, presence: true, length: {maximum: Settings.digit_255},
                    format: {with: Regexp.new(Settings.VALID_EMAIL_REGEX)},
                    uniqueness: true
  validates :password, presence: true, length: {minimum: Settings.digit_6},
                                       allow_nil: true

  has_secure_password
  attr_accessor :remember_token

  class << self
    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create string, cost:
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_column :remember_digest, User.digest(remember_token)
  end

  def forget
    update_column :remember_digest, nil
  end

  def authenticated? remember_token
    BCrypt::Password.new(remember_digest).is_password? remember_token
  end

  private

  def downcase_email
    email.downcase!
  end
end

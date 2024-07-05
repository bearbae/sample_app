
=begin
class User < ApplicationRecord


	after_update :run_callback_after_update

	def run_callback_after_update
		puts "callback_after_update"
	end
 

	

	before_save :test_callback_before_save
	around_save :test_callback_around_save
	after_save :test_callback_after_save

	def test_callback_before_save
		puts "before save"
	end
	def test_callback_around_save
		puts "in around_save"
		yield
		puts "out around save"
	end
	def test_callback_after_save
		puts "after save"
	end

	

	before_save :downcase_email
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true, length: {maximum: 50},
	validates :email, presence: true, length: {maximum: 255},
						format: {with: VALID_EMAIL_REGEX},
						uniqueness: true

	has_secure_password

	private

	def downcase_email
		self.email.downcase!
	end
end
=end 

class User < ApplicationRecord
  before_save :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  has_secure_password

  private

  def downcase_email
    self.email.downcase!
  end
end

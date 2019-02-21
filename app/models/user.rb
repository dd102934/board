# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  admin           :boolean          default(FALSE)
#  email           :string
#  name            :string
#  password_digest :string
#  remeber_digest  :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ApplicationRecord
  
  before_save :downcase_email
  
  validates :name,  presence: true, length: { maximum:  50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, 
    length: { minimum: 6 }, allow_nil: true
    
  def User.digest(string)
   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
   BCrypt::Password.create(string, cost: cost)
  end  
    
  
  private
  
    def downcase_email
      self.email = self.email.downcase
    end  
end

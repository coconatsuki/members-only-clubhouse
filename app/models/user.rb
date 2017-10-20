class User < ApplicationRecord
  attr_accessor :remember_token
  before_save :downcase_email
  has_secure_password


  def downcase_email
    self.email = email.downcase
  end

  #to generate a new random token
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  #take a string (token) and return a has digest
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #return true if a token matches an attribute's digest from the data base
  def authenticated?(digest_attribute, token)
    BCrypt::Password.new(digest_attribute).is_password?(token)
  end


  #---------------------------REMEMBER TOKEN---------------------------------#

  #to remember a user (and give him a remember_token cookie & signed id cookie)
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
end

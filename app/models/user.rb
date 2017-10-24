class User < ApplicationRecord
  has_many :posts
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

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end


  #---------------------------REMEMBER TOKEN---------------------------------#

  #to remember a user (and give him a remember_token cookie & signed id cookie)
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end

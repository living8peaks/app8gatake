class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token
  before_save { self.email = email.downcase }
  before_create :create_activation_digest
  validates :nonscreen_last_name, length: { maximum: 20 }
  validates :nonscreen_first_name, length: { maximum: 20 }
  validates :name, presence: true, length: { maximum: 20 },
                   uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)(?=.*?\W)[!-~]+\z/i
  validates :password, presence: true, length: { minimum: 8, maximum: 16 }, allow_nil: true, format: { with: VALID_PASSWORD_REGEX }
  enum gender_identities: { 男性: 0, 女性: 1, その他: 2, 回答しない: 3 }

  private

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # remember_digestが存在しない(値がnil)場合は、BCryptによるremember_digestの参照をさせないために、returnで止める
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end

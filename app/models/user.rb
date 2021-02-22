class User < ApplicationRecord
  validates :nonscreen_last_name, presence: true, length: { maximum: 20 }
  validates :nonscreen_first_name, presence: true, length: { maximum: 20 }
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
  validates :address, presence: true
end

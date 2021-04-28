class DmTalk < ApplicationRecord
  has_many :dm_menmberships, dependent: :destroy
  has_many :dm_members, class_name: 'User', through: :dm_menmberships, source: :user
  has_many :dm_messages, dependent: :destroy
end

class DmMessage < ApplicationRecord
  belongs_to :dm_talk
  belongs_to :user
  validates :dm_talk_id, presence: true
  validates :user_id,    presence: true
  validates :content,    presence: true, length: { maximum: 2000 }
end

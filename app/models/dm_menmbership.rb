class DmMenmbership < ApplicationRecord
  belongs_to :dm_talk
  belongs_to :user
  validates :user_id, uniqueness: { scope: :dm_talk_id }
end

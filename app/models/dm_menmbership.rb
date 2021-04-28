class DmMenmbership < ApplicationRecord
  after_destroy :destroy_empty_dm_talk
  
  belongs_to :dm_talk
  belongs_to :user
  validates :user_id, uniqueness: { scope: :dm_talk_id }

  private

    def destroy_empty_dm_talk
      dm_talk.destroy if dm_talk.reload.dm_memberships.empty?
    end
end

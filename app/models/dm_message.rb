class DmMessage < ApplicationRecord
  belongs_to :dm_talk
  belongs_to :user
end

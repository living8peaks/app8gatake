module Likable
  extend ActiveSupport::Concern

  def liked_by(user)
    Like.find_by(user_id: user.id, likable_id: id)
  end
end

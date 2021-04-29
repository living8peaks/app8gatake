class DmTalksController < ApplicationController
  before_action :login_required
  before_action :correct_dm_member, only: %i[show dm_messages]
  before_action :correct_user,      only: %i[show dm_messages]

  def show
    @dm_messages = @dm_talk.dm_messages
    @dm_message = DmMessage.new
  end

  def create
    @dm_talk = DmTalk.new
    @dm_talk.dm_memberships.build(user_id: current_user.id)
    @dm_talk.dm_memberships.build(user_id: params[:dm_member_id])
    @dm_talk.save
    redirect_to @dm_talk
  end

  def dm_messages
    @dm_message.new(dm_message_params)
    @dm_talk.touch
    if @dm_message.save
      redirect_to @dm_talk
    else
      @dm_messages = @dm_talk.dm_messages
      redirect_to :show
    end
  end

  private

    def dm_message_params
      params[:dm_message].merge!({ user_id: current_user.id, dm_talk_id: @dm_talk.id })
      params.require(:dm_message).permit(:user_id, :dm_talk_id, :content)
    end

    def correct_dm_member
      @dm_talk = current_user.dm_talks.find_by(id: params[:id])
      redirect_to root_url if @dm_talk.nil?
    end

    def correct_user
      @dm_message = current_user.dm_messages.find_by(id: params[:id])
      redirect_to root_url if @dm_message.nil?
    end
end

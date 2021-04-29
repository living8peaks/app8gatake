class DmMembershipsController < ApplicationController

  def create
    @dm_talk = DmTalk.find(params[:dm_talk_id])
    #params[:guest_users].each do |guest_user|
      # if @dm_talk.member?(guest_user)
      # else
      #   @dm_talk.add_member(guest_user)
      # end
    #end
  end

  def destroy
    @dm_membership.destroy
    #flash[:success]
    redirect_back(fallback_location: root_url)
  end

  private

    def correct_user
      @dm_membership = current_user.dm_memberships.find_by(id: params[:id])
      redirect_to root_url if @dm_membership.nil?
    end
end

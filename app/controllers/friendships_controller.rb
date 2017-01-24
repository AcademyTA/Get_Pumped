class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    friend         = User.find(params[:friend_id])
    new_friendship = friendship_params.merge(user_id: current_user.id)

    unless current_user.follows_or_same?(friend)
      Friendship.create(new_friendship)
    end

    redirect_to root_path
  end

  private

  def friendship_params
    params.permit(:friend_id, :user_id)
  end
end

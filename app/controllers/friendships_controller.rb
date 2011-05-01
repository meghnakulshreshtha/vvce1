class FriendshipsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_user
  
  def index
    @friends = @user.friends
  end
  
  def create
    @friendship = @user.friendships.build
    to_friend = User.find(params[:friend_id])
    @friendship.friend = to_friend
    if @friendship.save
      flash[:notice] = "Friend Request Sent"
      redirect_to user_path(to_friend)
    else
      flash[:error] = "Cannot send Friend Request"
      redirect_to user_path(to_friend)  
    end
  end
  
  def destroy
    @friendship = @user.friendships.find params[:id]
    @friend = @friendship.friend
    @reverse_friendship = @friend.friendships.where("friend_id = ?",@user.id).first
    @friendship.destroy
    @reverse_friendship.destroy
    redirect_to user_path(@friend)
  end
  
  def accept
    @friendship = @user.friendships.find params[:id]
    @friendship.accept = true
    @friendship.save!
    
    @friend = User.find(params[:friend_id])
    @reverse_friendship = @friend.friendships.build
    @reverse_friendship.friend = @user
    @reverse_friendship.save!
    
    redirect_to user_path(@friend) 
  end
  
  private
  
  def get_user
    @user = User.find(params[:user_id])
  end
end

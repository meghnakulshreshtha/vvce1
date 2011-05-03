class UsersController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:signup]
  before_filter :authorize, :only => [:home]
  
  def index
    redirect_to home_user_path current_user
  end
  
  def show
    @friend = User.find(params[:id])
    if current_user.is_friend? @friend
      @friendship = current_user.get_friendship @friend
    else
      @friendship = false
    end
  end

  def home
  end
  
  def signup
  end
  
  private 
  def authorize
    redirect_to home_user_path current_user unless current_user == User.find(params[:id])
  end
end

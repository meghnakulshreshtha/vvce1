class UsersController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:signup]
  before_filter :authorize, :only => [:home]
  
  def index
    redirect_to home_user_path current_user
  end
  
  def show
   @user = User.find(params[:id])
    @friend = User.find(params[:id])
    if current_user.is_friend? @friend
      @friendship = current_user.get_friendship @friend
    else
      @friendship = false
    end
  end

  def home
    @posts = current_user.wallposts
  end
  
  def signup
  end
  
  def post
    @post = Post.new(params[:post])
    @post.itemable = current_user
    @post.user = current_user
    if @post.valid?
      @post.save
      flash[:notice] = "Successfully Posted"
      redirect_to home_user_path current_user 
    else
      flash[:notice] = "Posting Failed.. Try Sometime Later..."
      redirect_to home_user_path current_user
    end    
  end
  
  private 
  def authorize
    redirect_to home_user_path current_user unless current_user == User.find(params[:id])
  end
end

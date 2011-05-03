class CommentsController < ApplicationController
  def create
    @post = Post.find params[:post_id]
    @comment = @post.comments.build params[:comment]
    @comment.user = current_user
    if @comment.valid?
      @comment.save
      flash[:notice] = "Comment Added"
      redirect_to params["back_url"]
    else
      flash[:notice] = "Error in adding comment"
      redirect_to params["back_url"]
    end    
  end
end

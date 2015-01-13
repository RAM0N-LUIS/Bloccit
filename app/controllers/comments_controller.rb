class CommentsController < ApplicationController
          
  def create
    @new_comment = Comment.new
    @comment = curent_user.comments.build(params.require(:comment).permit(:body))
    @post = Post.find(params[:post_id])
    @comment.post = @post
    authorize @comment
    
    if @comment.save
      flash[:notice] = "Comment added."
    else
      flash[:error] = "There was an error adding your comment. Please try again."
    end
  end
  
end
  
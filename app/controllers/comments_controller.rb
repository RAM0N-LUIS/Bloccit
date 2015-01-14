class CommentsController < ApplicationController
          
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comments = @post.comments
    @comment = curent_user.comments.build(params.require(:comment).permit(:body))
    @comment.post = @post
    
    authorize @comment
    
    if @comment.save
      flash[:notice] = "Comment added."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error adding your comment. Please try again."
    end
  end
  
end
  
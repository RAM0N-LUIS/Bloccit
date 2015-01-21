class CommentsController < ApplicationController
          
  def create
    @topic = @post.topic
    @post = posts.find(params[:post_id])
    @comment = current_user.comments.build(params.require(:comment).permit(:body))
    @comment.post = @post
    @comments = @post.comments
    
    authorize @comment
    
    if @comment.save
      flash[:notice] = "Comment added."
      redirect_to @post
    else
      flash[:error] = "There was an error adding your comment. Please try again."
    end
  end

  def destroy
    @topic = @post.topic
    @post = posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment removed." 
    else
      flash[:notice] = "Comment couldn't be deleted.  Try again."
    end

    redirect_to @post
  
  end

  
end
  
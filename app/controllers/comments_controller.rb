class CommentsController < ApplicationController
          
  def create
<<<<<<< HEAD
    @topic = @post.topic
    @post = posts.find(params[:post_id])
=======
    @post = Post.find(params[:post_id])
    @topic = @post.topic
>>>>>>> master
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
<<<<<<< HEAD
    @topic = @post.topic
    @post = posts.find(params[:post_id])
=======
    @post = Post.find(params[:post_id])
    @topic = @post.topic
>>>>>>> master
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
  
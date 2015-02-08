class CommentsController < ApplicationController
  respond_to :html, :js
          
  def create

    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = current_user.comments.build(params.require(:comment).permit(:body))
    @comment.post = @post
    @comments = @post.comments
    
    authorize @comment
    
    if @comment.save
      flash[:notice] = "Comment added."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error adding your comment. Please try again."
    end
  end

  def destroy

    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])

    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment removed." 
    else
      flash[:notice] = "Comment couldn't be deleted.  Try again."
    end

    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post] }
    end

  end

  
end
  
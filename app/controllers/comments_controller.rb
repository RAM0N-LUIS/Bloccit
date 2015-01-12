class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    # @topic = Topic.find(params[:topic_id])
  end

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    # @topic = Topic.find(params[:topic_id])
    authorize @post
  end
          
  def create
    @comment = curent_user.comments.build(params.require(:comment).permit(:body))
    @post = Post.find(params[:post_id])
    #@topic = Topic.find(params[:topic_id])
    @comment.post = @post
    authorize @comment
    
    if @comment.save
      flash[:notice] = "Comment added."
      redirect_to [@post, @topic]
    else
      flash[:error] = "There was an error adding your comment. Please try again."
      render :new
    end
  end
  
end
  
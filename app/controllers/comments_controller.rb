class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new 
    @post = Post.find_by_id(params[:post_id])
    @comment = Comment.find_by_id(params[:parent_id])
  end 

  def create
    @post = Post.find_by_id(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.ancestry = params[:comment][:parent_id]
    @comment.user_id = current_user.id

    if @comment.save  
      redirect_to post_path(@post)
      flash[:notice] = t('comment.create.success')
    else
      redirect_to post_path(@post)
      flash[:notice] = @comment.errors.massages.value[0]

    end 
  end

  def user_comments
    @user = User.find_by_id(params[:u_id])
    if @user.nil?
      redirect_to root_path, alert: "User not found"
      return
    end
    @comments = @user.comments.where(ancestry: nil)
  end
  
  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

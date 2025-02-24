class PostsController < ApplicationController
  def vote
    @post = Post.find_by(id: params[:id])
    
    if @post
      value = params[:type]
      
      if value.eql?("up")
        @post.vote_by voter: current_user, vote: "like", vote_scope: "reputation", vote_weight: 1
      else
        @post.vote_by voter: current_user, vote: "dislike", vote_scope: "reputation", vote_weight: -1
      end
  
      redirect_to @post, notice: t("voting_thanks")
    else
      redirect_to root_path, alert: t("post_not_found")
    end
  end
  
  def index
    @posts = Post.includes(:topic, :community).all  # Ensure @posts is assigned
  end
    def show
      @post = Post.find(params[:id])  # Fetch post by ID
      @comment = Comment.new 
    end
end
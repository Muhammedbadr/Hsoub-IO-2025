class TopicsController < ApplicationController
  before_action :authenticate_user!

  def new 
    @topic = Topic.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    
    if @post.save  # Ensure the post is saved first
      @topic = Topic.new(topic_params)
      @topic.post = @post 
      
      if @topic.save
        redirect_to @post, notice: "Topic successfully created."
      else
        render :new, status: :unprocessable_entity
      end 
    else 
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def topic_params
    params.require(:topic).permit(:text)
  end
  
  def post_params
    params.require(:topic).permit(:community_id, :title)  # Ensure this aligns with your form
  end
end

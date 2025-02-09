class CommunitiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_prams)  # Fixed strong parameters usage

    if @community.save
      redirect_to @community
    else 
      render :new
    end
  end

  def index
    @communities = Community.all
    Rails.logger.debug "DEBUG: Loaded communities: #{@communities.inspect}"
  end
  
  
  def show
    @community = Community.find_by_id(params[:id])
  end

  private

  def community_prams
    params.require(:community).permit(:name, :description)  # Fixed typo in `params`
  end 
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_voter
  has_many :posts
  has_many :comments
  def reputation
    result = 0 
    self.get_voted(Post).each do |post|
      result += post.get_upvotes(vote_scope: "reputation").sum(:vote_weight)
      result += post.get_downvotes(vote_scope: "reputation").sum(:vote_weight)
    end
    result
  end
end

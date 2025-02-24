class Comment < ApplicationRecord
  has_ancestry
  belongs_to :user
  belongs_to :post
  validates :text, presence: true
end

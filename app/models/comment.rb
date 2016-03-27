class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author, class_name: User

  validates :body, :author, :post, presence: true
end

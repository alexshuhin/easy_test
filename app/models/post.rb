class Post < ActiveRecord::Base
  belongs_to :author, class_name: User
  has_many :comments

  validates :title, :body, :published_at, presence: true

  acts_as_taggable

  scope :published, -> { where(published: true) }
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable,
    :trackable, :validatable

  has_many :posts
  has_many :comments

  validates :name, presence: true
end

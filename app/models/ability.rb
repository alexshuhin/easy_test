class Ability
  include CanCan::Ability

  def initialize(user)
    can [:read, :my], Post
    can :read, Comment

    if user.present?
      can :create, Post
      can [:update, :destroy], Post do |post|
        post.author == user
      end
      can :create, Comment
      can [:update, :destroy], Comment do |comment|
        Time.now.to_i - comment.created_at.to_i < 15.minutes &&
          comment.author == user
      end
    end
  end
end

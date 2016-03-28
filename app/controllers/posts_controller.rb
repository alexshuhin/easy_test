class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @posts = @posts.published.includes(:author)
      .order('published_at desc')
      .page(params[:page])
    if params[:tag].present?
      @posts = @posts.tagged_with(params[:tag])
    end
    @tags = Post.published.tag_counts_on(:tags)
  end

  def my
    @posts = @posts.where(author: current_user)
      .order('published_at desc')
      .page(params[:page])
  end

  def show
    @comments = @post.comments.includes(:author).order('created_at DESC')
  end

  def new
    @post = Post.new(published_at: DateTime.now, author: current_user)
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post), notice: 'Пост успешно создан'
    else
      flash[:alert] = "Есть ошибки"
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to post_path(@post), notice: 'Пост успешно сохранен'
    else
      flash[:alert] = "Есть ошибки"
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path, norice: 'Пост успешно удален'
  end

  private

  def post_params
    permit = %i(title body published_at published author_id)
    params.require(:post).permit(*permit, tag_list: [])
  end
end

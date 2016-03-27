class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment.assign_attributes(
      author: current_user,
      post: @post
    )

    if @comment.save
      redirect_to @post, notice: 'Комментарий создан'
    else
      flash[:error] = 'Ошибка при создании комментария'
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update_attributes(comment_params)
      redirect_to post_path(@comment.post), notice: 'Комментарий отредактирован'
    else
      flash[:error] = 'Ошибка при редактировании комментария'
      render :edit
    end
  end

  def destroy
    post = @comment.post

    @comment.destroy
    redirect_to :back, notice: 'Комментарий успешно удален'
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end

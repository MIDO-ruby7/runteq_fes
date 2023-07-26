class PostsController < ApplicationController
  def index
    @categories = Category.all
    @selected_category_id = params[:category_id]
    @posts = filtered_posts
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc) if @post
  end

  private

  def filtered_posts
    if @selected_category_id.present?
      Post.where(category_id: @selected_category_id)
    else
      last_category_id = @categories.last.try(:id)
      Post.where(category_id: last_category_id)
    end
  end
end

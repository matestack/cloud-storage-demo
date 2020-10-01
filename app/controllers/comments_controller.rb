class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.data_item_id = params[:data_item_id]

    @comment.save

    if @comment.errors.any?
      render json: { errors: @comment.errors }, status: :unprocessable_entity
    else
      render json: { }, status: :created
    end
  end

  protected

  def comment_params
    params.require(:comment).permit(:body)
  end

end

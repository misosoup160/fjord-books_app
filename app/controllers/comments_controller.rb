# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
    @comment = @commentable.comments.build(comment_params.merge(user_id: current_user.id))
    if @comment.save
      redirect_to @commentable, notice: 'コメントを投稿しました'
    else
      redirect_to @commentable
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end

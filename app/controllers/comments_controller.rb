class CommentsController < ApplicationController
  def create
    resource, id =  request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
    @comment = @commentable.comments.build(comment_params)
    @comment.save
    redirect_to @commentable, notice: 'コメントを投稿しました'   
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end

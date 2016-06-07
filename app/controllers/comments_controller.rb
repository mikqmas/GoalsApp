class CommentsController < ApplicationController
  def create
    @comment = Comment.new(body: params[:comment][:body],
                           commentable_id: params[:comment][:id],
                           commentable_type: params[:comment][:commentable_type],
                           author_id: params[:comment][:author_id])

    if @comment.save
      if @comment.commentable_type == "Goal"
        redirect_to goal_url(@comment.commentable_id)
      else
        redirect_to user_url(@comment.commentable_id)
      end
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to :back
    end
  end
end

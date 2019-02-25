class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:success] = 'コメントを投稿しました'
      redirect_to comment.board
    else
      flash[:comment] = comment
      flash[:danger] = comment.errors.full_messages
      redirect_back fallback_location: comment.board
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to comment.board, flash: { success: 'コメントが削除されました' }
  end

  private

  def comment_params
    params.require(:comment).permit(:board_id, :name, :comment)
  end
end


class BoardsController < ApplicationController
  
  before_action :logged_in_user, only: [:index, :edit, :show, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy  

  def index
    @boards = params[:tag_id].present? ? Tag.find(params[:tag_id]).boards : Board.all
    @boards = @boards.page(params[:page])
  end

  def new
    @board = Board.new(flash[:board])
  end

  def create
    board = current_user.boards.new(board_params)
    if board.save
      flash[:success] = "「#{board.title}」の掲示板を作成しました"
      redirect_to board
    else
      flash[:board] = board
      flash[:danger] = board.errors.full_messages
      redirect_back fallback_location: @board
    end
  end

  def show
    @board = Board.find(params[:id])
    @comment = Comment.new(board_id: @board.id)
  end

  def edit
    @board = Board.find(params[:id])
    @user1 = User.find(@board.user_id)
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
       redirect_to board_path, flash: { success: "掲示板の編集が完了しました" }
    else
      flash[:board] = @board
      flash[:danger] = @board.errors.full_messages
      redirect_back fallback_location: @board
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to boards_path, flash: { danger: "「#{@board.title}」の掲示板が削除されました" }
  end

  private

  def board_params
    params.require(:board).permit(:name, :title, :body, tag_ids: [])
  end

  def set_target_board
    @board = Board.find(params[:id])
  end
  
  private
  
  def logged_in_user
    unless logged_in?
      store_location
      flash.now[:danger] = "ログインしてください"
      render "sessions/new" 
    end
  end
  
  def correct_user
    @board = Board.find(params[:id])
    @user = User.find(@board.user_id)
    redirect_to(root_url) unless current_user?(@user)
  end
  
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
  
end
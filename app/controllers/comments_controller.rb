class CommentsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'was saved' }
        format.json { render action: 'show', status: :created, location: @comment }
        format.js {}
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      @comment = Comment.new
      @post = Post.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:post_id, :text, :user_id)
    end

end
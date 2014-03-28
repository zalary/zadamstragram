class CommentsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :create]

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'was saved' }
        format.json { render json: @comment, status: :created }
        # format.js { }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def comment_params
      params.require(:comment).permit(:post_id, :text, :user_id)
    end

    def set_user
      @user = current_user
    end
end

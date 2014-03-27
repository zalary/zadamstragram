class CommentsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]



  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      @comment = Comment.new
      @post = Post.find(params[:id])
    end

end

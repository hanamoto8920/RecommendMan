class Public::CommentsController < ApplicationController

  def create
    @shop = Shop.find(params[:shop_id])
    comment = current_user.comments.new(comment_params)
    comment.shop_id = @shop.id
    comment.save
    @comment = Comment.new
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    Comment.find_by(id: params[:id], shop_id: params[:shop_id]).destroy
    @comment = Comment.new
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end

end

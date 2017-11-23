class CommentsController < ApplicationController
  def create
    @product = Product.find_by("lower(name) = ?", de_url(params[:id]))
    @comment = Comment.new(comment_params)
    @comment.product = @product

    if @comment.save
      redirect_to san_pham_show_path(en_url(@product.name)) + "#binh-luan", notice: "Đăng bình luận thành công."
    else
      redirect_to san_pham_show_path(en_url(@product.name)) + '#binh-luan-moi', alert: "Vui lòng điền đầy đủ các thông tin."
    end
  end

  private

  def comment_params
    params[:comment].permit(:body, :product_id, :name, :email)
  end
end

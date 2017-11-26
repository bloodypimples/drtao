class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if params[:thing_type] == 'product'
      @product = Product.find_by("lower(name) = ?", de_url(params[:thing_id]))
      @comment.product = @product
    elsif params[:thing_type] == 'service'
      @service = Service.find_by("lower(name) = ?", de_url(params[:thing_id]))
      @comment.service = @service
    elsif params[:thing_type] == 'part'
      @part = Part.find_by("lower(name) = ?", de_url(params[:thing_id]))
      @comment.part = @part
    end

    if @comment.save
      redirect_to request.referer + '#binh-luan', notice: "Đăng bình luận thành công."
    else
      redirect_to request.referer + '#binh-luan-moi', alert: "Vui lòng điền đầy đủ các thông tin."
    end
  end

  private

  def comment_params
    params[:comment].permit(:body, :product_id, :service_id, :part_id, :name, :email)
  end
end

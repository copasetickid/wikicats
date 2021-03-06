class Api::V1::GraphsController < ApplicationController

  def show
    cat = params[:category] || 'sports'
    @category = Category.where(cat_title: cat.capitalize).first
    @links = Link.where(cl_to: @category.cat_title, cl_type: "subcat")
    render json: @links, each_serializer: LinkSerializer, root: @category.cat_title.downcase
  end

  private

  def graph_params
    params.require(:category).permit(:cl_to, :cl_type)
  end
end

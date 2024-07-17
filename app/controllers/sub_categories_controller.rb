class SubCategoriesController < ApplicationController

  def index

  end

  def show

  end

  def new
    @sub_category = SubCategory.new
    @categories = Category.all
  end

  def create
    @sub_category = SubCategory.new(sub_category_params)
    if @sub_category.save
      redirect_to sub_categories_path
    else
      @categories = Category.all
      render :new
    end
  end

  def edit
    @sub_category = SubCategory.find(params[:id])
    @categories = Category.all
  end

  def update
    @sub_category = SubCategory.find(params[:id])
    if @sub_category.update(sub_category_params)
      redirect_to sub_categories_path
    else
      @categories = Category.all
      render :edit
    end
  end

  def destroy
    @sub_category = SubCategory.find(params[:id])
    @sub_category.destroy
    redirect_to sub_categories_path
  end

  private

  def sub_category_params
    params.require(:sub_category).permit(:title, :description, :category_id)
  end

end

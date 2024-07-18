class SubCategoriesController < ApplicationController
  before_action :set_sub_category, only: [:show, :edit, :update, :destroy]
  before_action :set_category

  # GET /categories/:category_id/sub_categories
  def index
    @sub_categories = @category.sub_categories
  end

  # GET /categories/:category_id/sub_categories/1
  def show
  end

  # GET /categories/:category_id/sub_categories/new
  def new
    @sub_category = @category.sub_categories.build
  end

  # GET /categories/:category_id/sub_categories/1/edit
  def edit
  end

  # POST /categories/:category_id/sub_categories
  def create
    @sub_category = @category.sub_categories.build(sub_category_params)

    if @sub_category.save
      redirect_to category_sub_category_path(@category, @sub_category), notice: 'SubCategory was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /categories/:category_id/sub_categories/1
  def update
    if @sub_category.update(sub_category_params)
      redirect_to category_sub_category_path(@category, @sub_category), notice: 'SubCategory was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /categories/:category_id/sub_categories/1
  def destroy
    @sub_category.destroy
    redirect_to category_sub_categories_path(@category), notice: 'SubCategory was successfully destroyed.'
  end

  private

    def set_sub_category
      @sub_category = SubCategory.find(params[:id])
    end

    def set_category
      @category = Category.find(params[:category_id])
    end

    def sub_category_params
      params.require(:sub_category).permit(:name, :description, :category_id)
    end
end

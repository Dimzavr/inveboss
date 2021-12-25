class CategoriesController < ApplicationController
  
  before_action :set_category, only: [ :show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, success: 'Category successfully created '
    else
      flash.now[:danger] = 'Category not created'
      render :new
    end    
  end

  def edit
    
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, success: 'Category updated successfully'
    else
      flash.now[:danger] = 'Category not updated'
      render :edit
    end    
  end

  def destroy
    @category.destroy
    redirect_to categories_path, success: 'Category successfully deleted'
  end  

  private
    
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end 
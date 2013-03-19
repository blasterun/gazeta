class CategoriesController < ApplicationController
  
  def admin
    @categories = Category.all
    @articles = Article.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.valid?
    @category.save
    redirect_to categories_path
    else
    render "categories/new"
   end
  end

  def edit
    @category= Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    #@category.title = params[:category][:title]
    #@category.description = params[:category][:description]
    #@category.img_url = params[:category][:img_url]
    #@category.save 
    redirect_to categories_path
  end

  def destroy
     @category= Category.find(params[:id])
     @category.delete
     redirect_to categories_path
  end
end

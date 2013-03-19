class ArticlesController < ApplicationController
  def index
    @articles = Article.all(:order =>"created_at DESC") 
    @categories = Category.all
    @comments = Comment.find(:all, :order => "created_at DESC")
    @tags = Article.tag_counts_on(:tags)
  end
  
  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @articles = Article.all 
    #@related = Article.tagged_with([@article.tag_list],  :any => true).limit(5)
    #@similar = @article.find_by_name(params[:tag])
    #@article.find_related_skills
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    @article = Article.new(params[:article])
    @categories = Category.all
    if @article.valid?
     @article.save 
     flash[:notice] = "Article is created"
     redirect_to article_path(@article) 
   else
      render :action=>'new'
   end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article is deleted"
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
    @categories = Category.all
  end

  def update 
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article]) 
    flash[:notice] = "Article is updated"
    redirect_to articles_path
    @categories = Category.all
  end

  def tag
     @articles = Article.tagged_with(params[:tag])
  end
end

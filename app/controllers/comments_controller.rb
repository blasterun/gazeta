class CommentsController < ApplicationController
   def create
    #@comment = Comment.new
    @article = Article.find(params[:article_id])
    @comment = Comment.new(params[:comment])
    if @comment.valid?
      @comment.article = @rticle
      @comment.save
      flash[:notice] = "Comment is added"
      redirect_to article_path(@article)
    else
       #@article = Article.find(params[:article_id])
       render "articles/show"
    end
  end

  def destroy
     @article = Article.find(params[:article_id])
     @comment = @article.comments.find(params[:id])
     @comment.destroy
     redirect_to article_path(@article)
  end

end

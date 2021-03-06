class CommentsController < ApplicationController
 
	before_filter :authenticate_user!
	
	def create
		@article = Article.find(params[:article_id])
	    @comment = @article.comments.create(comment_params)
	    redirect_to article_path(@article)
	end
	 
	def destroy
	    @article = Article.find(params[:article_id])
	    @comment = @article.comments.find(params[:id])
	    @comment.destroy
	    redirect_to article_path(@article)
	end
	 
	private
	    def comment_params
	       p = params.require(:comment).permit(:body)
	       p[:user] = current_user
	       return p
	    end
	end
class CommentsController < ApplicationController
	 before_action :set_comment, only: [:show, :edit, :update, :destroy]
before_action :load_article
  def index
    @comments = @article.all
  end
  def new
    @comment = @article.comments.new
  end
def create
	@article = Article.find(params[:article_id])
	@comment = @article.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @article, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
end
def edit
	@article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
  end

  def update
  	@article = @comment.article
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @article, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
 def destroy
 	@article = @comment.article
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @article, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

def load_article
	@article = Article.find(params[:article_id])

end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_name, :comment, :article_id)
    end
end

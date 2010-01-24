#require 'date'

class CommentsController < ApplicationController
  "def index
    @comments = Comment.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end"

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(params[:comment])
    # @comment.name = "Anonymous" if @comment.name.empty? or @comment.name.nil? #isnt working

    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        format.html { redirect_to(@article) }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
end

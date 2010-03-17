class ArchivesController < ApplicationController
  def index
    @articles = Article.find(:all)
  end
  
  def year
    @year = params[:year]
    @articles = []
    Article.find(:all).each do |article|
      @articles << article if article.created_at.year == @year.to_i
    end
  end
  
  def month
    @year = params[:year]
    @month = params[:month]
    @articles = []
    Article.find(:all).each do |article|
      @articles << article if article.created_at.year == @year.to_i and article.created_at.month == @month.to_i
    end
  end
end

class ArchivesController < ApplicationController
  
  def year
    @year = params[:year]
    @articles = []
    Article.find(:all).each do |article|
      @articles << article if article.created_at.year == @year.to_i
    end
  end
  
  def month
    @months = {1 => 'January', 2 => 'February', 3 => 'March', 4 => 'April', 5 => 'May', 6 => 'June', 7 => 'July', 8 => 'August', 9 => 'September', 10 => 'October', 11 => 'November', 12 => 'December' }
    
    @year = params[:year]
    @month = params[:month]
    @articles = []
    Article.find(:all).each do |article|
      @articles << article if article.created_at.year == @year.to_i and article.created_at.month == @month.to_i
    end
  end
end

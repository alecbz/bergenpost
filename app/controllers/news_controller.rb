class NewsController < ApplicationController
  def index
    @n = News.find(:all)
  end
end
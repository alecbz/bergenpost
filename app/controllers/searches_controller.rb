class SearchesController < ApplicationController
  def index
#     @results = Article.find_with_ferret(params[:q], :limit => :all) if params[:q]
    @results = Article.search(params[:q], :limit => :all) if params[:q]
  end
end

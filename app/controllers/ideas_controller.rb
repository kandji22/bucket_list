class IdeasController < ApplicationController
  def index
    @search_term = params[:q]
    logger.info("le theme de recherche est #{@search_term} ")
    @idea =Idea.all
    @done_count=  @idea.length
  end

  def new

  end

  def create
    @title = params[:title]
    logger.info(@title)
    idea = Idea.new
    idea.title = params[:title]
    idea.save!
    redirect_to(ideas_index_path)
  end
end

class IdeasController < ApplicationController
  def index
    @search_term = params[:q]
    logger.info("le theme de recherche est #{@search_term} ")
    @idea =Idea.all
  end

  def new

  end

  def create
    @title = params[:title]
    logger.info(@title)
    idea = Idea.new
    idea.title = params[:title]
    idea.save!
    @done_count = 0
    @done_count++
    idea.done_count=@done_count
    idea.save!
    redirect_to(ideas_index_path)
  end
end

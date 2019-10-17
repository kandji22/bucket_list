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
    idea.done_count = params[:done_count]
    idea.photo_url = params[:photo_url]
    idea.save!
    redirect_to(ideas_index_path)
  end


  def edit
  end


  def update
  end


end

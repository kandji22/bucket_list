class IdeasController < ApplicationController
  def index
    @search_term = params[:q]
    logger.info("le theme de recherche est #{@search_term} ")
  end

  def new

  end

  def create
    @title = params[:title]
    logger.info("le theme de recherche est #{@title} ")
    redirect_to(ideas_index_path)
  end
end

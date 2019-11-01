class IdeasController < ApplicationController
  def index
    @search_term = params[:q]
    logger.info("le theme de recherche est #{@search_term} ")

    @idea =Idea.search(@search_term)
  end

  def new

  end

  def create
    @title = params[:title]
    logger.info(@title)
      hash={title:params[:title],done_count:params[:done_count],photo_url:params[:photo_url] }
    idea = Idea.new(hash)
    idea.save!
    redirect_to(ideas_index_path)
  end


  def edit
    id=params[:id]
    @idea= Idea.find(id)
  end


  def update
    hash={title:params[:title],done_count:params[:done_count],photo_url:params[:photo_url] }
    idea=Idea.find(params[:id])
    idea.update(hash)
    redirect_to(acount_ideas_path)

  end


  def show
@idea= Idea.find(params[:id])

  end


end

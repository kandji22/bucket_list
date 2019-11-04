class IdeasController < ApplicationController
  def index
    @search_term = params[:q]
    logger.info("le theme de recherche est #{@search_term} ")

    @idea =Idea.search(@search_term)
  end

  def new
  @idea=Idea.new
  end

  def create
    @title = params[:title]
    logger.info(@title)
    idea = Idea.new(idea_params)
    idea.save!
    redirect_to(ideas_path)
  end


  def edit
    id=params[:id]
    @idea= Idea.find(id)
  end


  def update
    idea=Idea.find(params[:id])
    idea.update(idea_resource_params)
    redirect_to(acount_ideas_path)

  end


  def show
@idea= Idea.find(params[:id])
  end


  private
def idea_params
  params.permit(:title,:photo_url,:done_count,:migration)
end

private
def idea_resource_params
  params.require(:idea).permit(:title,:photo_url,:done_count,:migration)
end


end

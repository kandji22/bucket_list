class IdeasController < ApplicationController
  def index
    @search_term = params[:q]
    logger.info("le theme de recherche es #{@search_term} ")
  end
end

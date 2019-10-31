class HomeController < ApplicationController
  def index
      @idea =Idea.most_recent
  end
end

class HomeController < ApplicationController
  def index
      @idea =Idea.all
  end
end

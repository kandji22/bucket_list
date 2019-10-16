class AcountController < ApplicationController
  def ideas
  @idea =Idea.all
  end
end

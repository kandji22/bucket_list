class AcountController < ApplicationController
  def ideas
    @acount = Acount.all
  end
end

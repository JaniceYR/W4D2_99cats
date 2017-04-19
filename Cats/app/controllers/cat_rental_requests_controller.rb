class CatRentalRequestsController < ApplicationController

  def create
    @all_cats = Cat.all
    render :new
  end
end

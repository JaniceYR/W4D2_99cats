class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def create
    @cat = Cat.new
    render :new
  end

  def update
    @cat = Cat.find(params[:id])
    render :edit
  end
end

class PotlucksController < ApplicationController
  def index
    @potlucks = Potluck.all
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @potluck = Potluck.find(params[:id])
  end

  def update
  end

  def destroy
  end
end

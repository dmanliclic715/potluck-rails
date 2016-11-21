require 'date'
class PotlucksController < ApplicationController
  before_action :authenticate_user!, only: [:destroy,:edit]

  def index
    @potlucks = Potluck.where("time > ?",DateTime.now).order(time: :desc)
  end

  def create
    @potluck = Potluck.new(potluck_params)
    @potluck.user_id = current_user.id
    if @potluck.save
      redirect_to root_path
    else
      @potlucks = Potluck.order(time: :desc)
      render "index"
    end
  end

  def new
  end

  def edit
    @potluck = Potluck.find(params[:id])
    authorize_user(@potluck)
  end

  def show
    @potluck = Potluck.find(params[:id])
  end

  def update
    @potluck = Potluck.find(params[:id])
    if @potluck.update(potluck_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    @potluck = Potluck.find(params[:id])
    @potluck.destroy
    redirect_to root_path
  end
  private
    def potluck_params
      params.require(:potluck).permit(:name, :location, :time, :user_id)
    end

    def authorize_user(obj)
      if current_user.id != obj.user_id
        redirect_to "https://www.youtube.com/watch?v=otCpCn0l4Wo", alert: "Can't do that"
      end
    end
end

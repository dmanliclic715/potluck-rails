class PotlucksController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]

  def index
    @potlucks = Potluck.order(time: :desc)
  end

  def create
    @potluck = Potluck.new(potluck_params)
    puts "!!!!!!!!!!!!!!!!!!#{@potluck.time}!!!!!!!!!!!!!!!!!!!!"
    @potluck.user_id = current_user.id
    if @potluck.save
      redirect_to root_path
    else
      p @potluck.time
      @potlucks = Potluck.order(time: :desc)
      render "index"
    end
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
    @potluck = Potluck.find(params[:id])
    @potluck.destroy
    redirect_to root_path
  end
  private
    def potluck_params
      params.require(:potluck).permit(:name, :location, :time, :user_id)
    end
end

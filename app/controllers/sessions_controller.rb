class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      render 'new'
    end
  end
  
end

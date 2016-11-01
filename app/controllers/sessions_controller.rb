class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      puts "!!!!!!!!! in the else"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end

end

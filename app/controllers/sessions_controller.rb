class SessionsController < ApplicationController
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(params[:username], params[:password])
    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["User not found!"]
      @user = User.new
      render :new
    end
  end

  def login(user)
    session[:session_token] = user.session_token
  end
  
end

class SessionsController < ApplicationController
  def new
    
  end

  def login
    @user = User.find_by(email: params[:email])
    puts "pwd:#{@user.authenticate(params[:password])}"
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user[:id]
      redirect_to :controller =>'users', :action=>'show', :id =>@user[:id]
    else 
      flash[:errors] = ['Invalid']
      redirect_to '/sessions/new' 
    end
  end
  def logout
    session[:user_id] = nil
    if session[:user_id] ==nil
      
      redirect_to '/sessions/new'
    end
  end
end

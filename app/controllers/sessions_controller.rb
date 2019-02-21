class SessionsController < ApplicationController

  def new
    #@session = Session.new
  end
  
  # POST /login 
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # Success
      log_in user
      redirect_to user
    else
      # Failure
      render 'new'
    end
  end
  
  # DELETE /logout
  def destroy
    log_out
    redirect_to root_url
  end
end

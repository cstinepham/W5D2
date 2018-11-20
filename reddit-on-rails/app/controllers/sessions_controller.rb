class SessionsController < ApplicationController
  
  def new
    render :new
  end
  
  def create
    user = user.find_by_credentials(params[:user][:username], params[:user][:password])
    if user
      log_in(user)
      #redirect_to
    else
      flash.now[:errors] = ['Invalid Credentials']
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to new_session_url
  end
end

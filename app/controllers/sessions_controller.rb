class SessionsController < ApplicationController

  def new
  end

  def create
    p params
    user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      log_in(user)
      redirect_to root_url
    else
      flash.now[:danger] = 'Incorrect email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
class Admin::SessionsController < ApplicationController
  def login
  end

  def create
    admin = AdminUser.find_by(email: params[:sessions][:email])
    if admin && admin.authenticate(params[:sessions][:password])
      session[:admin_id] = admin.id
      redirect_to admin_index_path
    else
      render 'login'
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to admin_login_path
  end
end
class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]  
  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_to root_path
    else
      flash.now[:danger] = 'Email o contraseña incorrectas!'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end

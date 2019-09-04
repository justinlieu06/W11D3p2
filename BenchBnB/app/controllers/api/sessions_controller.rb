class Api::SessionsController < ApplicationController
  
  def create
    user = User.find_by_credentials(
      params[:user][:username], 
      params[:user][:password]
    )
    if user.nil?
      render json: "username/password incorrect"
    else
      login(user)
      render "/views/api/users/show"
    end
  end

  def destroy
    if logged_in?
      logout 
      render json: {}
    else
      render "Not logged in", status: 404 
    end
  end
end

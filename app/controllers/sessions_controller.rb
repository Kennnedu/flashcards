# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  before_action :authorize, only: [:new, :create]

  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_to root_path, notice: 'You successfull authorize!'
    else
      redirect_to new_sessions_path, notice: 'Your email or password is invalid!'
    end
  end

  def destroy
    logout
    redirect_to new_sessions_path
  end
end

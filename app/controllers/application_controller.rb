# app/controller/application_controller.rb
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def not_authenticated
    redirect_to new_sessions_path, notice: 'You should authorize!'
  end

  def authorize
    redirect_to root_path, notice: 'You authorized already!' if current_user
  end
end

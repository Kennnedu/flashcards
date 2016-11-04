# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authorize, only: [:new, :create]
  before_action :require_login, only: [:edit, :update]

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(params_new_user)
    if @user.save
      login_with_new_params
      redirect_to root_path
    else
      redirect_to new_users_path, notice: @user.errors.full_messages.join(' ')
    end
  end

  def update
    if current_user.update(params_edit_user)
      redirect_to root_path, notice: 'Your profile successful updated!'
    else
      redirect_to edit_users_path, notice: current_user.errors.full_messages.join(' ')
    end
  end

  def update_current_deck
    if current_user.update(params_change_current_deck)
      redirect_to root_path, notice: 'Deck was successful changed!'
    else
      redirect_to root_path, notice: 'Deck wasn\'t changed!'
    end
  end

  private

  def login_with_new_params
    login(params_new_user[:email], params_new_user[:password])
  end

  def params_new_user
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def params_edit_user
    params.permit(:email, :password, :password_confirmation)
  end

  def params_change_current_deck
    params.require(:user).permit(:current_deck)
  end
end

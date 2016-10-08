class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def subscribe
    current_user.subscribed_subs << Sub.find(params[:sub_id])
    redirect_to :back
  end

  def create
    user = User.new(user_params)
    if user.save
      login(user)
      redirect_to user_url(user)
    else
      flash.new[:errors] = user.errors.full_messages
      render :new
    end
  end

  def show

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end

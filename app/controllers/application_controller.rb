class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  before_action :set_object, only: [:update, :edit, :destroy, :show]

  def index
    @objects = self.class.model.all
  end

  def destroy
    @object.destroy
    redirect_to index_url
  end

  def update
    @object.update(required_params)
    redirect_to item_url(@object)
  end

  def set_object
    @object = self.class.model.find(params[:id])
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def logout(user)
    user.reset_session_token!
    session[:session_token] = nil
  end

  def redirect_to_sign_in
    unless current_user
      flash[:errors] = ["You must be logged in to do that"]
      redirect_to new_session_url
    end
  end

  def self.model
    controller_name.classify.constantize
  end
end

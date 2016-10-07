class SubsController < ApplicationController
  before_action :redirect_to_sign_in, only: [:create, :edit, :update, :new, :destroy]

  def create
    new_object = self.class.model.new(required_params)
    new_object.moderator = current_user
    if new_object.save
      redirect_to item_url(new_object)
    else
      flash[:errors] = new_object.errors.full_messages
      redirect_to new_item_url
    end
  end

  def set_object
    @object = self.class.model.friendly.find(params[:id])
  end

  private
  def index_url
    subs_url
  end

  def new_item_url
    new_sub_url
  end

  def edit_item_url(object)
    edit_sub_url(object)
  end

  def item_url(object)
    sub_url(object)
  end

  def required_params
    params.require(:sub).permit(:title, :description)
  end
end

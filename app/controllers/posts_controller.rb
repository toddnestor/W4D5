class PostsController < ApplicationController
  before_action :redirect_to_sign_in, only: [:create, :edit, :update, :new, :destroy]
  before_action :set_subs, only: [:new, :edit]

  def show
    @all_comments = @object.comments_by_parent_id
  end

  def create
    new_object = self.class.model.new(required_params)
    new_object.author = current_user
    if new_object.save
      redirect_to item_url(new_object)
    else
      flash[:errors] = new_object.errors.full_messages
      redirect_to new_item_url
    end
  end

  def upvote
    post = Post.find(params[:post_id])
    post.receive_vote(current_user, 1)
    redirect_to post_url(post)
  end

  def downvote
    post = Post.find(params[:post_id])
    post.receive_vote(current_user, -1)
    redirect_to post_url(post)
  end

  private

  def set_object
    @object = self.class.model.friendly.find(params[:id])
  end
  
  def set_subs
    @subs = Sub.all
  end

  def index_url
    posts_url
  end

  def new_item_url
    new_post_url
  end

  def edit_item_url(object)
    edit_post_url(object)
  end

  def item_url(object)
    post_url(object)
  end

  def required_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end

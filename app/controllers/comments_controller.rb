class CommentsController < ApplicationController

  def create
    new_object = self.class.model.new(required_params)
    new_object.author = current_user
    unless new_object.save
      flash[:errors] = new_object.errors.full_messages
    end
    redirect_to post_url(new_object.post)
  end

  def show
    @all_comments = @object.comments_by_parent_id
  end


  def upvote
    comment = Comment.find(params[:comment_id])
    comment.receive_vote(current_user, 1)
    redirect_to post_url(comment.post_id)
  end

  def downvote
    comment = Comment.find(params[:comment_id])
    comment.receive_vote(current_user, -1)
    redirect_to post_url(comment.post_id)
  end

  private
  def required_params
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end
end

class CommentsController < ApplicationController
  before_action :require_log_in!
  
  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = 
    @comment.author_id = current_user.id
    @comment.parent_comment_id = 
    
  end
  
  def comment_params
    params.require(:comment).permit(:content)
  end
end

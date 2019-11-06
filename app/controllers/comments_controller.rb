class CommentsController < ApplicationController
def create
  @idea=Idea.find(params[:idea_id])
  comment=Comment.new(comment_param)
  comment.idea=@idea
  comment.save!
  redirect_to(idea_path(@idea))
end

  private
  def comment_param
  params.require(:comment).permit(:body)
end
end

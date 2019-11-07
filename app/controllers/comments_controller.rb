class CommentsController < ApplicationController
def create
  @user =User.find(session[:user_id])
  @idea=Idea.find(params[:idea_id])
  comment=Comment.new(comment_param)
  comment.idea=@idea
  comment.user=@user
  comment.save!
  redirect_to(idea_path(@idea))
end

  private
  def comment_param
  params.require(:comment).permit(:body)
end
end

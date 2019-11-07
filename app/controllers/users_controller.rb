class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def create

  User.find_or_create_by(params_user)
  redirect_to(ideas_path)
  end


  private
  def params_user
    params.require(:user).permit(:email)
  end
end

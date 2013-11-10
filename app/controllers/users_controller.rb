class UsersController < ApplicationController
  before_filter :authenticate_owner!

  def show
    @user = User.find(params[:id])
  end

  private

  def authenticate_owner!
    if user_signed_in? && current_user.id == params[:id].to_i
      return
    else
      redirect_to '/', :notice => "You must have permission to access this page."
    end
  end

end
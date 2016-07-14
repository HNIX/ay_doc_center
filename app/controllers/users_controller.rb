class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def show
	@user = User.find(params[:id])
	@documents = Document.all
	@categories = Category.all
  end

end
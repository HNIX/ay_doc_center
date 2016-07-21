class UsersController < ApplicationController
  load_and_authorize_resource

  def index
  end
  
  def show
	@documents = Document.all
	@categories = Category.all
  end

end
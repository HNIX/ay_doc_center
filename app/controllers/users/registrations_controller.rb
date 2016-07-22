class Users::RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper

  def create
    flash[:info] = 'Registrations are not open'
    redirect_to new_user_session_path
  end

  def new
    flash[:info] = 'Registrations are not open'
    redirect_to new_user_session_path
  end

  def edit
    super
  end
end

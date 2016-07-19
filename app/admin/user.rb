ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :email, :first_name, :last_name, :title, :office_phone, :mobile_phone, :password, :password_confirmation
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  filter :first_name
  filter :last_name
  filter :title
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count

  index do
  	selectable_column
    column :name do |user|
      link_to user.first_name + " " + user.last_name, admin_user_path(user)
    end
    column :title
    column :email
    column :office_phone
    column :mobile_phone
    actions
  end


  show do
    attributes_table do
      row :name do |user|
        user.first_name + " " + user.last_name
      end
      row :title
      row :email
      row :office_phone
      row :mobile_phone
    end
  end
  

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :first_name
      f.input :last_name
      f.input :title
      f.input :office_phone
      f.input :mobile_phone
    end
    f.actions
  end

end





  
 

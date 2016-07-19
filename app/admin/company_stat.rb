ActiveAdmin.register CompanyStat do

  filter :name
  filter :stat

  permit_params :name, :stat, :desc
  
  index do
  	selectable_column
    column :name, label: "Title"
    column :stat, label: "Value"
    column :desc, label: "Description"
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :stat
      row :desc, label: "Description"
      row :created_at
      row :updated_at
    end
  end
  
  form do |f|
    inputs 'Details' do
      input :name
      input :stat
      input :desc, label: "Description", :input_html => { :class => 'autogrow', :rows => 7, :cols => 20, :maxlength => 10  }
      li "Created at #{f.object.created_at}" unless f.object.new_record?
      li "Updated at #{f.object.updated_at}" unless f.object.new_record?
    end
    para "Press cancel to return to the list without saving."
    actions
  end
  

end

ActiveAdmin.register Category do
  
  sortable tree: true, 
  	sorting_attribute: :ancestry, collapsible: true, start_collapsed: true

  permit_params :name, :desc, :ancestry, :parent_id

  filter :name
  filter :ancestry

  
  # index do
  # 	selectable_column
  #   id_column
  #   column :name
  #   column :desc
  #   column :ancestry
  #   actions
  # end
  index as: :sortable do 
    label :name do |categories|
      categories.name
    end
  	  actions
  end
 
  show do
    attributes_table do
      row :parent
      row :name
      row :desc, label: "Description"
      row :documents do 
        category.documents.count.to_s
      end
    end
  end
  
  form do |f|
    inputs 'Details' do
      input :parent_id, label: "Parent", as: :select, collection: ancestry_options(Category.where(nil).arrange(:order => 'name')) {|i| "#{'-' * i.depth} #{i.name}" }, promt: true
      input :name
      input :desc, label: "Description", :input_html => { :class => 'autogrow', :rows => 7, :cols => 20, :maxlength => 10  }
      li "Created at #{f.object.created_at}" unless f.object.new_record?
    end
    para "Press cancel to return to the list without saving."
    actions
  end
  

end


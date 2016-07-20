ActiveAdmin.register Document do

  permit_params :name, :desc, :category_id, :attachment, :word, :ppt, :remove_attachment, :word_cache, :remove_word, :remove_ppt, :ppt_cache, :tag_list


  filter :name
  filter :category
  
  controller do
    # This code is evaluated within the controller class
    def update
      update! do |format|
        @document.create_activity :update
      end
    end
  end


  index as: :grid, columns: 4 do |document|
    div do
      a :href => admin_document_path(document) do
        image_tag(document.attachment.thumb.url)
      end
    end

    a truncate(document.name + " - " + document.category.name), :href => admin_document_path(document)
  end

  show do
    attributes_table do
      row :name
      row :category do |document|
        if document.category.parent
          document.category.parent.name + " > " + document.category.name 
        else
          document.category.name
        end
      end
      row :desc, label: "Description"
      row :attachment
      row :word
      row :ppt

      row :created_at
      row :updated_at
    end
  end
  
 
  form do |f|
    f.inputs "Document Details" do
      f.input :name
      f.input :category, as: :select, collection: ancestry_options(Category.where(nil).arrange(:order => 'name')) {|i| "#{'-' * i.depth} #{i.name}" }, promt: true
      f.input :desc, label: "Description", :input_html => { :class => 'autogrow', :rows => 7, :cols => 20, :maxlength => 10  }
      f.input :attachment, :image_preview => true
      f.input :word
      f.input :ppt
      li "Created at #{f.object.created_at}" unless f.object.new_record?
    end
    para "Press cancel to return to the list without saving."
    actions
  end

end

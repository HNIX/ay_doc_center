class AddPptToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :ppt, :string
  end
end

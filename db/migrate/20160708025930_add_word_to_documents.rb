class AddWordToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :word, :string
  end
end

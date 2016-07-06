class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :user, index: true
      t.string :name
      t.text :desc
      t.boolean :is_private
      t.boolean :is_writable
      t.references :category, index: true

      t.timestamps
    end
  end
end

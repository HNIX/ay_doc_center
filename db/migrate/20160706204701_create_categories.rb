class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :desc
      t.boolean :is_private
      t.boolean :is_writable
      t.boolean :is_featured

      t.timestamps
    end
  end
end

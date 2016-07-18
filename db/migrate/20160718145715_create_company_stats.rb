class CreateCompanyStats < ActiveRecord::Migration
  def change
    create_table :company_stats do |t|
      t.string :name
      t.integer :stat
      t.text :desc
      t.string :type

      t.timestamps
    end
  end
end

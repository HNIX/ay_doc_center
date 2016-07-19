class ChangeTitleFormatInUsers < ActiveRecord::Migration
  def change
  	change_column :users, :title, :string
  end
end

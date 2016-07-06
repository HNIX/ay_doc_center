class AddOfficePhoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :office_phone, :string
  end
end

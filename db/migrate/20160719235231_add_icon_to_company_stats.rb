class AddIconToCompanyStats < ActiveRecord::Migration
  def change
    add_column :company_stats, :icon, :string
  end
end

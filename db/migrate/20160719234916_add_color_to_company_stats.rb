class AddColorToCompanyStats < ActiveRecord::Migration
  def change
    add_column :company_stats, :color, :string
  end
end

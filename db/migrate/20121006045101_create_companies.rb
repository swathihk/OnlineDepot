class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.timestamps
    end
    Company.create(:name => "Eabyas info solution")
  end
end

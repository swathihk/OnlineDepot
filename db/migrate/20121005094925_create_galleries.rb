class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.integer :photographer_id
      t.string :name
      t.timestamps
    end
  end
end

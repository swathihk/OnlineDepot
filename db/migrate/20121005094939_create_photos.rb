class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :gallery_id
      t.string :name
      t.string :file_path
      t.timestamps
    end
  end
end

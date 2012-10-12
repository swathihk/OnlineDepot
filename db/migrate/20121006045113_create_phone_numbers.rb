class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.integer :callable_id
      t.string :callable_type
      t.string :number
      t.string :location
      t.timestamps
    end
  end
end

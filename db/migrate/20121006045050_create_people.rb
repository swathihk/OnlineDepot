class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.timestamps
    end
    Person.create(:name => "swathi")
  end
end

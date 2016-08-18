class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :district
      t.integer :prep_classes
      t.integer :sec_classes
      t.integer :uni_classes

      t.timestamps null: false
    end
  end
end

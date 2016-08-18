class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.integer :duration
      t.string :participants
      t.string :overview

      t.timestamps null: false
    end
  end
end

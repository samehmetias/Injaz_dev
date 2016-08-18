class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name, default: ""
      t.datetime :date
      t.references :implementer_request, index: true, foreign_key: true
      t.string :status, :default => 'pending'

      t.timestamps null: false
    end
  end
end

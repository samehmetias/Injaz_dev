class CreateImplementerRequests < ActiveRecord::Migration
  def change
    create_table :implementer_requests do |t|
      t.string :classroom, default: ""
      t.datetime :start_date
      t.integer :duration, default: 0
      t.belongs_to :School, index: true, foreign_key: true
      t.belongs_to :User, index: true, foreign_key: true
      t.belongs_to :Program, index: true, foreign_key: true
      t.string :status, :default => 'pending'

      t.timestamps null: false
    end
  end
end

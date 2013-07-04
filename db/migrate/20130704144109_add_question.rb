class AddQuestion < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title
      t.integer :poll_id

      t.timestamps
    end
  end
end

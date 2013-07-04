class FixAnswer < ActiveRecord::Migration
  def up
    change_table :answers do |t|
      t.remove :answer
      t.text :body
    end
  end

  def down
    change_table :answers do |t|
      t.remove :body
      t.text :answer
    end
  end
end

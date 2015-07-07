class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.boolean :charged

      t.timestamps null: false
    end
  end
end

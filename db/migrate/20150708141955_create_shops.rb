class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :types

      t.timestamps null: false
    end
  end
end

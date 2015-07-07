class CreatePrefetches < ActiveRecord::Migration
  def change
    create_table :prefetches do |t|
      t.string :types

      t.timestamps null: false
    end
  end
end

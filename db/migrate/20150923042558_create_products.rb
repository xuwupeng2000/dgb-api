class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description

      t.decimal :weight

      t.decimal  "purchasing_price"
      t.decimal  "selling_price"

      t.string :state

      t.timestamps null: false
    end
  end
end

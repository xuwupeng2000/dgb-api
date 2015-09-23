class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user
      t.references :customer

      t.date :placed_at
      t.string :ref
      t.string :state

      t.timestamps null: false
    end
  end
end

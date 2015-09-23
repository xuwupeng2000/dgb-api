class CreateDeliverables < ActiveRecord::Migration
  def change
    create_table :deliverables do |t|
      t.references :order

      t.string :ref
      t.string :address
      t.string :state
      t.date :delivered_at

      t.timestamps null: false
    end
  end
end

class CreateDeliverables < ActiveRecord::Migration
  def change
    create_table :deliverables do |t|

      t.timestamps null: false
    end
  end
end

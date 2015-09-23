class CreateProductUsers < ActiveRecord::Migration
  def change
    create_table :product_users do |t|
      t.references :product
      t.references :user

      t.timestamps null: false
    end
  end
end

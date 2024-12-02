class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :product_name, null: false
      t.text :info, null: false
      t.integer :category, null: false
      t.integer :sales_status, null: false
      t.integer :shipping_cost, null: false
      t.integer :prefecture, null: false
      t.integer :shipping, null: false
      t.integer :prise, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end

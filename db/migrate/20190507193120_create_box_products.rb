class CreateBoxProducts < ActiveRecord::Migration
  def change
    create_table :box_products do |t|
      t.integer :box_id
      t.integer :product_id
    end
  end
end

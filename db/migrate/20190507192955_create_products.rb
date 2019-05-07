class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.string :oil
      t.string :benefit
    end
  end
end

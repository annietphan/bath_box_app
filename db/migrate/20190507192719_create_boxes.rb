class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.string :name
      t.string :description
    end
  end
end

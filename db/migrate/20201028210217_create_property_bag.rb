class CreatePropertyBag < ActiveRecord::Migration[5.1]
  def change
    create_table :property_bag do |t|
      t.string :name
      t.string :value
    end
    add_index :property_bag, :name, unique: true
  end
end

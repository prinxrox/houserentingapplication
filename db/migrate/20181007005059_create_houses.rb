class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :location
      t.integer :sqft
      t.string :yearbuilt
      t.string :style
      t.string :price
      t.integer :floors
      t.boolean :basement
      t.string :currentowner
      t.integer :real_estate_company_id
      t.integer :realtor_id

      t.timestamps
    end
    add_index :houses, :real_estate_company_id
    add_index :houses, :realtor_id
  end
end

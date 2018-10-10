class CreateRealEstateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :real_estate_companies do |t|
      t.string :name
      t.string :website
      t.string :address
      t.integer :size
      t.string :founded
      t.string :revenue
      t.text :synopsis

      t.timestamps
    end
  end
end

class AddcompanyTorealtor < ActiveRecord::Migration[5.2]
  def change
    add_reference :realtors, :real_estate_company, index: true
    add_foreign_key :realtors, :real_estate_company
  end
end

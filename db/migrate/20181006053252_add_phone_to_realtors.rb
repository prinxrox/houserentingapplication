class AddPhoneToRealtors < ActiveRecord::Migration[5.2]
  def change
    add_column :realtors, :phone, :string
  end
end

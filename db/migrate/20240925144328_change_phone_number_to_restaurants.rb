class ChangePhoneNumberToRestaurants < ActiveRecord::Migration[7.2]
  def change
    change_column :restaurants, :phone_number, :string
  end
end

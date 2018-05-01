class CreateRegistrationUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :registration_users do |t|
      t.string :phone_number
      t.string :password
      t.string :password_confirmation

      t.timestamps
    end
  end
end

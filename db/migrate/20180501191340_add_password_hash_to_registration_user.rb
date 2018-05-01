class AddPasswordHashToRegistrationUser < ActiveRecord::Migration[5.1]
  def change
    add_column :registration_users, :password_hash, :string
  end
end

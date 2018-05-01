class ChangeRegistrationUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :registration_users, :password_confirmation, :password_salt
  end
end

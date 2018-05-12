class AddMoreToRegistrationUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :registration_users, :name, :string
    add_column :registration_users, :email, :string
    add_column :registration_users, :avatar, :string
    add_column :registration_users, :signature, :string
    add_column :registration_users, :posts_count, :integer, default: 0, null: false
    add_column :registration_users, :comments_count, :integer, default: 0, null: false
  end
end

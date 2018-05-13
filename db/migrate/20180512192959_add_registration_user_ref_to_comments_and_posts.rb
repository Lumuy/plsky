class AddRegistrationUserRefToCommentsAndPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :registration_user
    add_belongs_to :posts, :registration_user
  end
end

class ChangeReferenceOfSsConf < ActiveRecord::Migration[5.1]
  def change
    remove_reference :ss_confs, :registration_users
    add_reference :ss_confs, :registration_user, index: true
  end
end

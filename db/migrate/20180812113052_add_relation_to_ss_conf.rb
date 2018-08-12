class AddRelationToSsConf < ActiveRecord::Migration[5.1]
  def change
    add_reference :ss_confs, :registration_users, index: true
  end
end

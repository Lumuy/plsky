class AddUserIdToSsConf < ActiveRecord::Migration[5.1]
  def change
    add_reference :ss_confs, :user, index: true
  end
end

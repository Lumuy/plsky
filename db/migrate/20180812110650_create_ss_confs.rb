class CreateSsConfs < ActiveRecord::Migration[5.1]
  def change
    create_table :ss_confs do |t|
      t.string :host
      t.integer :port
      t.string :password

      t.timestamps
    end
  end
end

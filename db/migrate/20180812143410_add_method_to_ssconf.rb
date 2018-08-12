class AddMethodToSsconf < ActiveRecord::Migration[5.1]
  def change
    add_column :ss_confs, :method, :string, default: ''
  end
end

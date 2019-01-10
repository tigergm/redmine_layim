class AddLayimToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sign, :string, :limt => 512
    add_column :users, :online_status, :string, :limit => 20
    add_column :users, :init_skin, :string, :limit => 128
  end
end

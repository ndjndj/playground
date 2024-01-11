class RenameUidColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :uid, :user_system_id
  end
end

class RenameUderIdToUserId < ActiveRecord::Migration[5.0]
  def change
    rename_column :potlucks, :uder_id, :user_id
  end
end

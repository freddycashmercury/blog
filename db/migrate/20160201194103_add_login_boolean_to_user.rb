class AddLoginBooleanToUser < ActiveRecord::Migration
  def change
    add_column :users, :can_login, :boolean
  end
end

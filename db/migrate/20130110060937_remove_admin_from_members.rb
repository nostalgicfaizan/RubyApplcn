class RemoveAdminFromMembers < ActiveRecord::Migration
  def up
  	  remove_column  :members, :admin
      remove_column  :members, :boolean
  end

  def down
  	  add_column :members, :admin, :string
  	  add_column :members, :boolean, :string
  end
end

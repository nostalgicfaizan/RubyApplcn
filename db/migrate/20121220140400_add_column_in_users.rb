class AddColumnInUsers < ActiveRecord::Migration
  def self.up
     add_column :users, :attach_file_description,  :string
  end

  def self.down
     remove_column :users, :attach_file_description
  end
end

class AddForeignKeys < ActiveRecord::Migration
  def self.up
    add_column :notebooks, :user_id, :integer, {:null => false}
    add_column :notes, :user_id, :integer, {:null => false}
    add_column :notes, :notebook_id, :integer, {:null => false}
  end

  def self.down    
    remove_column :notebooks, :user_id 
    remove_column :notes, :user_id 
    remove_column :notes, :notebook_id 
  end
end

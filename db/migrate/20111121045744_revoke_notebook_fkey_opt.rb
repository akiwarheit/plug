class RevokeNotebookFkeyOpt < ActiveRecord::Migration
  def self.up
    change_column :notes, :notebook_id, :integer, {:null => true}
  end

  def self.down
    change_column :notes, :notebook_id, :integer, {:null => false}
  end
end

class AddTimestampsForNotebookAndroid < ActiveRecord::Migration
  def self.up
    add_column :notebooks, :created_android, :datetime
    add_column :notebooks, :updated_android, :datetime
  end

  def self.down
    remove_column :notebooks, :created_android
    remove_column :notebooks, :updated_android
  end
end

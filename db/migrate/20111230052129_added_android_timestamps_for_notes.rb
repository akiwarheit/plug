class AddedAndroidTimestampsForNotes < ActiveRecord::Migration
  def self.up
    add_column :notes, :created_android, :datetime
    add_column :notes, :updated_android, :datetime
  end

  def self.down
    remove_column :notes, :created_android
    remove_column :notes, :updated_android
  end
end

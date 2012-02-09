class AddPhotosToNoteAndNotebook < ActiveRecord::Migration
  def self.up
    add_column :notes, :photo_file_name, :string
    add_column :notes, :photo_content_type, :string
    add_column :notes, :photo_file_size, :integer
    add_column :notes, :photo_updated_at, :datetime
    
    add_column :notebooks, :photo_file_name, :string
    add_column :notebooks, :photo_content_type, :string
    add_column :notebooks, :photo_file_size, :integer
    add_column :notebooks, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :notes, :photo_file_name
    remove_column :notes, :photo_content_type
    remove_column :notes, :photo_file_size
    remove_column :notes, :photo_updated_at    
    
    remove_column :notebooks, :photo_file_name
    remove_column :notebooks, :photo_content_type
    remove_column :notebooks, :photo_file_size
    remove_column :notebooks, :photo_updated_at
  end
end

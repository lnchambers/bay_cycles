class AddPaperclipFieldsToAccessory < ActiveRecord::Migration[5.1]
  def change
    add_column :accessories, :image_file_name, :string
    add_column :accessories, :image_content_type, :string
    add_column :accessories, :image_file_size, :integer
    add_column :accessories, :image_updated_at, :datetime
  end
end

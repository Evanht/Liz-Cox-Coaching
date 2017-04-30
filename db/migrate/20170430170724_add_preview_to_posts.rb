class AddPreviewToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :preview, :text
  end
end

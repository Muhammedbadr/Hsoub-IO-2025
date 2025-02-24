class AddAcvestryToComments < ActiveRecord::Migration[7.2]
  def change
    add_column :comments, :acvestry, :string
    add_index :comments, :acvestry
  end
end

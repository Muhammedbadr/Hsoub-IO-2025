class CreateTopics < ActiveRecord::Migration[7.2]
  def change
    create_table :topics do |t|
      t.text :text
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end

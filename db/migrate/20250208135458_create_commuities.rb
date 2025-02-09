class CreateCommuities < ActiveRecord::Migration[7.2]
  def change
    create_table :commuities do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

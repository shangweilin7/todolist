class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :title
      t.datetime :date
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string  :title
      t.text  :content
      t.text :image
      t.datetime :schedule
      t.integer :owner_id, index: true

      t.timestamps
    end
    add_foreign_key :events, :users, column: :owner_id
  end
end

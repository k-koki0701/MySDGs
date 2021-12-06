class AddTableToEventMessage < ActiveRecord::Migration[5.2]
  def change
    create_table :event_messages do |t|
      t.references :event_room, foreign_key: true
      t.references :user, foreign_key: true
      t.text :body
      t.integer :read

      t.timestamps
    end
  end
end

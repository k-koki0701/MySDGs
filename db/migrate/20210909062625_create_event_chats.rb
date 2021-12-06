class CreateEventChats < ActiveRecord::Migration[5.2]
  def change
    create_table :event_chats do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end

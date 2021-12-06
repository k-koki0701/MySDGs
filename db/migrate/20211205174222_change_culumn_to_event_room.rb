class ChangeCulumnToEventRoom < ActiveRecord::Migration[5.2]
  def change
    remove_column :event_rooms, :user_id
  end
end

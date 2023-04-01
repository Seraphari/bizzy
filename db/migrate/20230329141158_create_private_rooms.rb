class CreatePrivateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :private_rooms do |t|

      t.timestamps
    end
  end
end

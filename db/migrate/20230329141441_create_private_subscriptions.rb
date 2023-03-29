class CreatePrivateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :private_subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :privateroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end

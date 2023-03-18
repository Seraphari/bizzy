class CreateFounderSectors < ActiveRecord::Migration[7.0]
  def change
    create_table :founder_sectors do |t|
      t.references :founder, null: false, foreign_key: true
      t.references :sector, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateInvestorSectors < ActiveRecord::Migration[7.0]
  def change
    create_table :investor_sectors do |t|
      t.references :investor, null: false, foreign_key: true
      t.references :sector, null: false, foreign_key: true

      t.timestamps
    end
  end
end

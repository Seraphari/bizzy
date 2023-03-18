class CreateFounders < ActiveRecord::Migration[7.0]
  def change
    create_table :founders do |t|
      t.string :company_name
      t.text :company_description
      t.string :company_email
      t.string :company_UEN
      t.string :funding_stage
      t.date :date_incorporated
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

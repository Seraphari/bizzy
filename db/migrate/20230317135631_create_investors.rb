class CreateInvestors < ActiveRecord::Migration[7.0]
  def change
    create_table :investors do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.text :company_description
      t.string :company_email
      t.string :company_UEN
      t.string :funding_stage
      t.string :ticket_size

      t.timestamps
    end
  end
end

class AddUserIdToInvestor < ActiveRecord::Migration[7.0]
  def change
    add_reference :investors, :user, foreign_key: true
  end
end

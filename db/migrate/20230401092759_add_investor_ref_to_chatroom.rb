class AddInvestorRefToChatroom < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :investor, foreign_key: true
  end
end

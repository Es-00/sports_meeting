class AddStatusToWinners < ActiveRecord::Migration[5.0]
  def change
    add_column :winners, :status, :string
  end
end

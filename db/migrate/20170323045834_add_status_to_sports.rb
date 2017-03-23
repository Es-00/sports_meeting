class AddStatusToSports < ActiveRecord::Migration[5.0]
  def change
    add_column :sports, :status, :string
  end
end

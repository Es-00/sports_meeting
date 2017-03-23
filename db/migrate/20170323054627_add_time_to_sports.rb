class AddTimeToSports < ActiveRecord::Migration[5.0]
  def change
    add_column :sports, :hour, :string
    add_column :sports, :minute, :string
  end
end

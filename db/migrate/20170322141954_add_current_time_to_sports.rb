class AddCurrentTimeToSports < ActiveRecord::Migration[5.0]
  def change
    add_column :sports, :time, :string
  end
end

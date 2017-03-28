class AddWeekToSports < ActiveRecord::Migration[5.0]
  def change
    add_column :sports, :week, :string
    add_column :sports, :wday, :string
  end
end

class AddNewToSports < ActiveRecord::Migration[5.0]
  def change
    add_column :sports, :teamone, :string
    add_column :sports, :teamtwo, :string
  end
end

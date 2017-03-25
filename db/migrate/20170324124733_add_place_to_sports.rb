class AddPlaceToSports < ActiveRecord::Migration[5.0]
  def change
    add_column :sports, :place, :string
  end
end

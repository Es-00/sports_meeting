class CreateSports < ActiveRecord::Migration[5.0]
  def change
    create_table :sports do |t|
      t.string :title
      t.string :winner
      t.string :loser
      t.string :wp
      t.string :lp

      t.timestamps
    end
  end
end

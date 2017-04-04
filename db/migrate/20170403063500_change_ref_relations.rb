class ChangeRefRelations < ActiveRecord::Migration[5.0]
  def change
    change_table :sports do |t|
      t.belongs_to :category, index: true
    end
    change_table :teams do |t|
      t.belongs_to :category, index: true
    end
    create_table :sports_teams, id: false do |t|
      t.belongs_to :sport, index: true
      t.belongs_to :team, index: true
    end

  end
end

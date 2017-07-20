class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.datetime :date
      t.string :location
      t.integer :team1_id
      t.integer :team2_id

      t.timestamps
    end
  end
end

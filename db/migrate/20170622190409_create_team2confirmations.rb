class CreateTeam2confirmations < ActiveRecord::Migration[5.0]
  def change
    create_table :team2confirmations do |t|
      t.integer :game_id
      t.integer :team_id
      t.integer :user_id

      t.timestamps
    end
  end
end

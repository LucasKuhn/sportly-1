class CreateConfirmations < ActiveRecord::Migration[5.0]
  def change
    create_table :confirmations do |t|
      t.integer :game_id
      t.integer :team_id
      t.integer :user_id

      t.timestamps
    end
  end
end

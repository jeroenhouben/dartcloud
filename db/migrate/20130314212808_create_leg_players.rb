class CreateLegPlayers < ActiveRecord::Migration
  def change
    create_table :leg_players, id: false do |t|
      t.uuid :id, unique: true, null: false, primary: true
      t.uuid :player_id, null: false
      t.uuid :leg_id, null: false
    end
  end
end

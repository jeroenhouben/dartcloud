class CreateMatchPlayers < ActiveRecord::Migration
  def change
    create_table :match_players, id: false do |t|
      t.uuid :id, unique: true, null: false, primary: true
      t.uuid :match_id, null: false
      t.uuid :player_id, null: false
    end
  end
end

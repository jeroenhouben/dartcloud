class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns, id: false do |t|
      t.uuid :id, unique: true, null: false, primary: true
      t.uuid :leg_player_id, :null => false
      t.integer :dart1
      t.integer :dart2
      t.integer :dart3
      t.boolean :completed, null: false, default: false
      t.integer :simple_score
    end
  end
end

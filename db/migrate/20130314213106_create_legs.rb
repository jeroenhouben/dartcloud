class CreateLegs < ActiveRecord::Migration
  def change
    create_table :legs, id: false do |t|
      t.uuid :id, unique: true, null: false, primary: true
      t.uuid :match_id, null: false
      t.uuid :winner_id
    end
  end
end

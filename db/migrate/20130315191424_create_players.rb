class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players, id: false do |t|
      t.uuid :id, unique: true, null: false, primary: true
      t.string :name, :null => false
    end
  end
end

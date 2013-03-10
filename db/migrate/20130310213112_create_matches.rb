class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches, id: false do |t|
      t.uuid :id, unique: true, null: false, primary: true
      t.integer :start_score, null: false
    end
  end
end

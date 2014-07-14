class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.references :user
      t.references :movie
      t.integer :win_count
      t.integer :match_count, default: 0

      t.timestamps
    end
  end
end

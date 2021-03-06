class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.references :user
      t.references :movie
      t.integer :win_count, default: 0
      t.integer :match_count, default: 0
      t.boolean :has_watched, default: true

      t.timestamps
    end
  end
end

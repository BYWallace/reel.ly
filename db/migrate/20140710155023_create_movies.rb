class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.integer :year, null: false
      t.text :poster_url
      t.float :rating
      t.text :imdb_url

      t.timestamps
    end
  end
end

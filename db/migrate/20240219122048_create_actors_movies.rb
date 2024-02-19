class CreateActorsMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :actors_movies do |t|

      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true
      t.timestamps
    end
  end
end

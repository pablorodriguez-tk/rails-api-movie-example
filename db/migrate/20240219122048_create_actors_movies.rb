class CreateActorsMovies < ActiveRecord::Migration[7.1]
  def change
    create_join_table :movies, :users
  end
end

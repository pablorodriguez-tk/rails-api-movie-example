class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :gender
      t.date :release_date
      t.integer :qualification

      t.references :director, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

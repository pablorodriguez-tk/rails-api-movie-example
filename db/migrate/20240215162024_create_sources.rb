class CreateSources < ActiveRecord::Migration[7.1]
  def change
    create_table :sources do |t|
      t.string :format
      t.string :path
      t.string :duration
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :document
      t.integer :document_type
      t.date :birthday

      t.timestamps
    end
  end
end

class CreateSubmissions < ActiveRecord::Migration[7.1]
  def change
    create_table :submissions do |t|
      t.references :student, null: false, foreign_key: { to_table: :users }
      t.references :worksheet, null: false, foreign_key: true
      t.json :answers
      t.json :grades

      t.timestamps
    end
  end
end

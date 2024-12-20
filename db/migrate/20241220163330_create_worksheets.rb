class CreateWorksheets < ActiveRecord::Migration[7.1]
  def change
    create_table :worksheets do |t|
      t.string :title
      t.references :classroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end

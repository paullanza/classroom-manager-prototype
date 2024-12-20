class CreateStudentEnrollmentCodes < ActiveRecord::Migration[7.1]
  def change
    create_table :student_enrollment_codes do |t|
      t.references :classroom, null: false, foreign_key: true
      t.string :code
      t.string :email
      t.boolean :used
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :student_enrollment_codes, :code, unique: true
  end
end

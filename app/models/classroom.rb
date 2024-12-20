class Classroom < ApplicationRecord
  belongs_to :course
  has_many :student_enrollment_codes, dependent: :destroy
  has_many :worksheets, dependent: :destroy
end

class StudentEnrollmentCode < ApplicationRecord
  belongs_to :classroom
  belongs_to :user, optional: true # Assigned after a student uses the code
end

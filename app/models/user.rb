class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :courses, foreign_key: :teacher_id, dependent: :destroy
  has_many :classrooms, through: :courses
  has_many :student_enrollment_codes, dependent: :destroy

  # Role check methods
  def teacher?
    role == 'teacher'
  end

  def student?
    role == 'student'
  end

  def ta?
    role == 'ta'
  end
end

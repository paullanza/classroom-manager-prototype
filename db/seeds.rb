# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

# Users
User.destroy_all
teacher = User.create!(first_name: 'John', last_name: 'Doe', email: '1@a.a', role: 'teacher', password: 'password')
ta = User.create!(first_name: 'Mark', last_name: 'Brown', email: '2@a.a', role: 'ta', password: 'password')

# Create 30 Students
students = 30.times.map do |i|
  User.create!(
    first_name: "Student#{i + 1}",
    last_name: "Last#{i + 1}",
    email: "student#{i + 1}@example.com",
    role: 'student',
    password: 'password'
  )
end

# Course
course = Course.create!(name: 'Math 101', description: 'Introduction to Algebra', teacher: teacher)

# Classroom
classroom = Classroom.create!(name: '2024 - 2025', course: course)

# Student Enrollment Codes
students.each do |student|
  StudentEnrollmentCode.create!(
    classroom: classroom,
    code: SecureRandom.hex(4), # Generate a unique 8-character code
    email: student.email,
    used: true,
    user: student
  )
end

# Worksheets and Questions
worksheet = Worksheet.create!(title: 'Week 1 Algebra', classroom: classroom)

Question.create!(
  content: 'What is 2 + 2?',
  question_type: 'multiple_choice',
  choices: ['2', '3', '4', '5'],
  answer: '4',
  worksheet: worksheet
)

Question.create!(
  content: 'Explain why 2 + 2 equals 4.',
  question_type: 'long_answer',
  rubric: 'The explanation should clearly reference the addition operation and basic arithmetic principles.',
  worksheet: worksheet
)

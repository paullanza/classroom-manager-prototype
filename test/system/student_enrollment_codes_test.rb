require "application_system_test_case"

class StudentEnrollmentCodesTest < ApplicationSystemTestCase
  setup do
    @student_enrollment_code = student_enrollment_codes(:one)
  end

  test "visiting the index" do
    visit student_enrollment_codes_url
    assert_selector "h1", text: "Student enrollment codes"
  end

  test "should create student enrollment code" do
    visit student_enrollment_codes_url
    click_on "New student enrollment code"

    fill_in "Classroom", with: @student_enrollment_code.classroom_id
    fill_in "Code", with: @student_enrollment_code.code
    fill_in "Email", with: @student_enrollment_code.email
    check "Used" if @student_enrollment_code.used
    fill_in "User", with: @student_enrollment_code.user_id
    click_on "Create Student enrollment code"

    assert_text "Student enrollment code was successfully created"
    click_on "Back"
  end

  test "should update Student enrollment code" do
    visit student_enrollment_code_url(@student_enrollment_code)
    click_on "Edit this student enrollment code", match: :first

    fill_in "Classroom", with: @student_enrollment_code.classroom_id
    fill_in "Code", with: @student_enrollment_code.code
    fill_in "Email", with: @student_enrollment_code.email
    check "Used" if @student_enrollment_code.used
    fill_in "User", with: @student_enrollment_code.user_id
    click_on "Update Student enrollment code"

    assert_text "Student enrollment code was successfully updated"
    click_on "Back"
  end

  test "should destroy Student enrollment code" do
    visit student_enrollment_code_url(@student_enrollment_code)
    click_on "Destroy this student enrollment code", match: :first

    assert_text "Student enrollment code was successfully destroyed"
  end
end

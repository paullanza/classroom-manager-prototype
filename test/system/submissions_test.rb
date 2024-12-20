require "application_system_test_case"

class SubmissionsTest < ApplicationSystemTestCase
  setup do
    @submission = submissions(:one)
  end

  test "visiting the index" do
    visit submissions_url
    assert_selector "h1", text: "Submissions"
  end

  test "should create submission" do
    visit submissions_url
    click_on "New submission"

    fill_in "Answers", with: @submission.answers
    fill_in "Grades", with: @submission.grades
    fill_in "Student", with: @submission.student_id
    fill_in "Worksheet", with: @submission.worksheet_id
    click_on "Create Submission"

    assert_text "Submission was successfully created"
    click_on "Back"
  end

  test "should update Submission" do
    visit submission_url(@submission)
    click_on "Edit this submission", match: :first

    fill_in "Answers", with: @submission.answers
    fill_in "Grades", with: @submission.grades
    fill_in "Student", with: @submission.student_id
    fill_in "Worksheet", with: @submission.worksheet_id
    click_on "Update Submission"

    assert_text "Submission was successfully updated"
    click_on "Back"
  end

  test "should destroy Submission" do
    visit submission_url(@submission)
    click_on "Destroy this submission", match: :first

    assert_text "Submission was successfully destroyed"
  end
end

require "application_system_test_case"

class WorksheetsTest < ApplicationSystemTestCase
  setup do
    @worksheet = worksheets(:one)
  end

  test "visiting the index" do
    visit worksheets_url
    assert_selector "h1", text: "Worksheets"
  end

  test "should create worksheet" do
    visit worksheets_url
    click_on "New worksheet"

    fill_in "Classroom", with: @worksheet.classroom_id
    fill_in "Title", with: @worksheet.title
    click_on "Create Worksheet"

    assert_text "Worksheet was successfully created"
    click_on "Back"
  end

  test "should update Worksheet" do
    visit worksheet_url(@worksheet)
    click_on "Edit this worksheet", match: :first

    fill_in "Classroom", with: @worksheet.classroom_id
    fill_in "Title", with: @worksheet.title
    click_on "Update Worksheet"

    assert_text "Worksheet was successfully updated"
    click_on "Back"
  end

  test "should destroy Worksheet" do
    visit worksheet_url(@worksheet)
    click_on "Destroy this worksheet", match: :first

    assert_text "Worksheet was successfully destroyed"
  end
end

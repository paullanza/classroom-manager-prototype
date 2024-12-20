require "test_helper"

class StudentEnrollmentCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_enrollment_code = student_enrollment_codes(:one)
  end

  test "should get index" do
    get student_enrollment_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_student_enrollment_code_url
    assert_response :success
  end

  test "should create student_enrollment_code" do
    assert_difference("StudentEnrollmentCode.count") do
      post student_enrollment_codes_url, params: { student_enrollment_code: { classroom_id: @student_enrollment_code.classroom_id, code: @student_enrollment_code.code, email: @student_enrollment_code.email, used: @student_enrollment_code.used, user_id: @student_enrollment_code.user_id } }
    end

    assert_redirected_to student_enrollment_code_url(StudentEnrollmentCode.last)
  end

  test "should show student_enrollment_code" do
    get student_enrollment_code_url(@student_enrollment_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_enrollment_code_url(@student_enrollment_code)
    assert_response :success
  end

  test "should update student_enrollment_code" do
    patch student_enrollment_code_url(@student_enrollment_code), params: { student_enrollment_code: { classroom_id: @student_enrollment_code.classroom_id, code: @student_enrollment_code.code, email: @student_enrollment_code.email, used: @student_enrollment_code.used, user_id: @student_enrollment_code.user_id } }
    assert_redirected_to student_enrollment_code_url(@student_enrollment_code)
  end

  test "should destroy student_enrollment_code" do
    assert_difference("StudentEnrollmentCode.count", -1) do
      delete student_enrollment_code_url(@student_enrollment_code)
    end

    assert_redirected_to student_enrollment_codes_url
  end
end

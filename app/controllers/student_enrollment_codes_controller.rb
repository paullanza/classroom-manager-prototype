class StudentEnrollmentCodesController < ApplicationController
  before_action :set_student_enrollment_code, only: %i[ show edit update destroy ]

  # GET /student_enrollment_codes or /student_enrollment_codes.json
  def index
    @student_enrollment_codes = StudentEnrollmentCode.all
  end

  # GET /student_enrollment_codes/1 or /student_enrollment_codes/1.json
  def show
  end

  # GET /student_enrollment_codes/new
  def new
    @student_enrollment_code = StudentEnrollmentCode.new
  end

  # GET /student_enrollment_codes/1/edit
  def edit
  end

  # POST /student_enrollment_codes or /student_enrollment_codes.json
  def create
    @student_enrollment_code = StudentEnrollmentCode.new(student_enrollment_code_params)

    respond_to do |format|
      if @student_enrollment_code.save
        format.html { redirect_to @student_enrollment_code, notice: "Student enrollment code was successfully created." }
        format.json { render :show, status: :created, location: @student_enrollment_code }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student_enrollment_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_enrollment_codes/1 or /student_enrollment_codes/1.json
  def update
    respond_to do |format|
      if @student_enrollment_code.update(student_enrollment_code_params)
        format.html { redirect_to @student_enrollment_code, notice: "Student enrollment code was successfully updated." }
        format.json { render :show, status: :ok, location: @student_enrollment_code }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student_enrollment_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_enrollment_codes/1 or /student_enrollment_codes/1.json
  def destroy
    @student_enrollment_code.destroy!

    respond_to do |format|
      format.html { redirect_to student_enrollment_codes_path, status: :see_other, notice: "Student enrollment code was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_enrollment_code
      @student_enrollment_code = StudentEnrollmentCode.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_enrollment_code_params
      params.require(:student_enrollment_code).permit(:classroom_id, :code, :email, :used, :user_id)
    end
end

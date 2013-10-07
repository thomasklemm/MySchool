class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  def index
    @students = current_school.students.all
  end

  # GET /students/1
  def show
  end

  # GET /students/new
  def new
    @student = current_school.students.build
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  def create
    @student = current_school.students.build(student_params)

    if @student.save
      redirect_to @student, notice: 'Schuler wurde erfolgreich erstellt.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'Schuler wurde erfolgreich aktualisiert.'
    else
      render action: 'edit'
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
    redirect_to students_url, notice: 'Schüler wurde erfolgreich gelöscht.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = current_school.students.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_params
      params.require(:student).permit(:last_name, :first_name, :form_of_address, :gender, :date_of_birth, :email)
    end
end

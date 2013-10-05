class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  # GET /teachers
  def index
    @teachers = current_school.teachers.all
  end

  # GET /teachers/1
  def show
  end

  # GET /teachers/new
  def new
    @teacher = current_school.teachers.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers
  def create
    @teacher = current_school.teachers.new(teacher_params)

    if @teacher.save
      redirect_to @teacher, notice: 'Lehrer wurde erfolgreich erstellt.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /teachers/1
  def update
    if @teacher.update(teacher_params)
      redirect_to @teacher, notice: 'Lehrer wurde erfolgreich aktualisiert.'
    else
      render action: 'edit'
    end
  end

  # DELETE /teachers/1
  def destroy
    @teacher.destroy
    redirect_to teachers_url, notice: 'Lehrer wurde erfolgreich gelöscht.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = current_school.teachers.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def teacher_params
      params.require(:teacher).permit(:last_name, :first_name, :form_of_address, :gender, :date_of_birth, :email, :shorthand_symbol)
    end
end

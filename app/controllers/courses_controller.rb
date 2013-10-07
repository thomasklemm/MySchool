class CoursesController < KlassController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  def index
    @courses = @klass.courses.all
  end

  # GET /courses/1
  def show
  end

  # GET /courses/new
  def new
    @course = @klass.courses.build
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  def create
    @course = @klass.courses.build(course_params)

    if @course.save
      # FIXME: This should not be nescessary!
      @klass.courses << @course
      @course.students = @klass.students

      redirect_to [@klass, @course], notice: 'Fach wurde erfolgreich erstellt.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      redirect_to [@klass, @course], notice: 'Fach wurde erfolgreich aktualisiert.'
    else
      render action: 'edit'
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
    redirect_to [@klass, :courses], notice: 'Fach wurde erfolgreich gelöscht.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = @klass.courses.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def course_params
      params.require(:course).permit(:name, :teacher_id)
    end
end

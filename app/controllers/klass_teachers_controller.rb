class KlassTeachersController < KlassController
  def index
    @teachers = @klass.teachers
  end
end

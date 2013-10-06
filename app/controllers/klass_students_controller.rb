class KlassStudentsController < KlassController
  def index
    @students = @klass.students
  end
end

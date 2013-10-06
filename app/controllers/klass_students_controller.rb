class KlassStudentsController < KlassController
  def index
    @students = @klass.students.order(last_name: :asc, first_name: :asc)
  end
end

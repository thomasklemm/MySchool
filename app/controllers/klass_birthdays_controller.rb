class KlassBirthdaysController < KlassController
  def index
    @students = @klass.students
  end
end

class KlassBirthdaysController < KlassController
  def index
    @students = BirthdaySorter.new(@klass.students).sort_by_birthday_in_school_year(current_school_year[:start_date])
  end
end

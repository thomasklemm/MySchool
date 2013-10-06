class Birthday
  def initialize(date_of_birth, start_of_term, end_of_term)
    @date_of_birth = date_of_birth
    @start_of_term = start_of_term
    @end_of_term   = end_of_term
  end
  attr_reader :date_of_birth, :start_of_term, :end_of_term

  delegate :year, :month, :day, to: :date_of_birth, prefix: true

  # Returns the birthday that's within the term dates
  def birthday_in_term
    if birthday_in_start_of_term_year.between?(start_of_term, end_of_term)
      birthday_in_start_of_term_year
    elsif birthday_in_end_of_term_year.between?(start_of_term, end_of_term)
      birthday_in_end_of_term_year
    end
  end

  def today?
    date_of_birth.strftime('%m%d') == Date.current.strftime('%m%d')
  end

  def current_week?
    DateRange.current_week.include?(birthday_in_term)
  end

  def next_week?
    DateRange.next_week.include?(birthday_in_term)
  end

  def current_month?
    DateRange.current_month.include?(birthday_in_term)
  end

  def birthday_in_term_in_the_past?
    birthday_in_term < Date.current
  end

  def birthday_in_term_today?
    birthday_in_term == Date.current
  end

  def birthday_in_term_in_the_future?
    birthday_in_term > Date.current
  end

  def birthday_in_start_of_term_year
    Time.local(start_of_term.year, date_of_birth_month, date_of_birth_day).to_date
  end

  def birthday_in_end_of_term_year
    Time.local(end_of_term.year, date_of_birth_month, date_of_birth_day).to_date
  end

  def current_age
    Date.current.year - date_of_birth_year - (birthday_in_term_in_the_future? ? 1 : 0)
  end

  def age_on_birthday_in_term
    birthday_in_term.year - date_of_birth_year
  end
end

class DateRange
  class << self
    def today
      Date.current
    end

    def current_week
      beginning_of_current_week..end_of_current_week
    end

    def beginning_of_current_week
      today.beginning_of_week
    end

    def end_of_current_week
      today.end_of_week
    end

    def next_week
      beginning_of_next_week..end_of_next_week
    end

    def beginning_of_next_week
      beginning_of_current_week.weeks_since(1)
    end

    def end_of_next_week
      end_of_current_week.weeks_since(1)
    end

    def current_month
      beginning_of_current_month..end_of_current_month
    end

    def beginning_of_current_month
      today.beginning_of_month
    end

    def end_of_current_month
      today.end_of_month
    end
  end
end



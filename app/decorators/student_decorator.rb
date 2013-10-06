class StudentDecorator < Draper::Decorator
  delegate_all

  # Returns 03.08.
  def birthday
    return unless model.date_of_birth.present?
    I18n.l(date_of_birth).first(6)
  end

  def birthday_today?
    birthday_calculator.today?
  end

  def current_age
    birthday_calculator.current_age
  end

  def age_on_birthday_in_school_year
    birthday_calculator.ago_on_birthday_in_term
  end

  private

  def birthday_calculator
    Birthday.new(model.date_of_birth, h.current_school_year.starts_on, h.current_school_year.ends_on)
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end

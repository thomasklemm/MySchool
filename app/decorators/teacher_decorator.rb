class TeacherDecorator < Draper::Decorator
  delegate_all

  def date_of_birth
    dob = model.date_of_birth
    dob.present? ? I18n.l(dob) : nil
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

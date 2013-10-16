class Test < ActiveRecord::Base
  delegate :url_helpers, to: 'Rails.application.routes'
  belongs_to :klass
  belongs_to :teacher
  validates :name, :date, :klass_id, :teacher_id, presence: true
  scope :by_date, ->(direction=:asc) { order(date: direction) }
  default_scope { by_date }

  def title_in_cal
    "[#{klass.name}] #{name} (#{teacher.name})".html_safe
  end

  def as_json
    { title: title_in_cal,
      start: date,
      url: url_helpers.edit_test_path(self) }
  end
end

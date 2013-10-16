class SchoolYear < ActiveRecord::Base
  belongs_to :school
  has_many :klasses
  has_many :tests, through: :klasses
  has_many :courses
  validates :school_id, :name, :start_date, :end_date, presence: true
  localize_fields :start_date, :end_date
  scope :by_date, ->(direction=:asc) { order(start_date: direction) }
  default_scope { by_date }

  def date_range
    self[:start_date]..self[:end_date]
  end

  def weekdays
    date_range.to_a.select { |day| day.wday.in?(1..5)  }
  end

  def weekend_days
    date_range.to_a.select { |day| day.wday.in?([0,6])  }
  end
end

class SchoolYear < ActiveRecord::Base
  belongs_to :school
  has_many :klasses
  has_many :tests, through: :klasses
  has_many :courses
  validates :school_id, :name, :start_date, :end_date, presence: true

  def date_range
    start_date..end_date
  end

  def weekdays
    date_range.to_a.select { |day| day.wday.in?(1..5)  }
  end
end

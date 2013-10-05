class Klass < ActiveRecord::Base
  belongs_to :school
  belongs_to :school_year

  has_many :klass_students
  has_many :students, through: :klass_students

  before_validation :set_school_from_school_year

  validates :name, presence: true

  private

  def set_school_from_school_year
    self.school_id = school_year.school_id if school_year.present?
  end
end

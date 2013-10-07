class Klass < ActiveRecord::Base
  belongs_to :school_year
  has_many :klass_students
  has_many :students, through: :klass_students
  has_many :parents, through: :students
  has_many :course_klasses
  has_many :courses, through: :course_klasses
  validates :school_year_id, :name, presence: true
end

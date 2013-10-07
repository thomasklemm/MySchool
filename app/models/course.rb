class Course < ActiveRecord::Base
  belongs_to :school_year
  belongs_to :teacher
  has_many :course_klasses
  has_many :klasses, through: :course_klasses
  has_many :course_students
  has_many :students, through: :course_students
  validates :name, :teacher_id, :school_year_id, presence: true
end

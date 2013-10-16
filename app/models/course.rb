class Course < ActiveRecord::Base
  belongs_to :school_year, inverse_of: :courses
  belongs_to :teacher, inverse_of: :courses
  has_many :course_klasses
  has_many :klasses, through: :course_klasses
  has_many :course_students
  has_many :students, through: :course_students
  validates :name, :teacher_id, :school_year_id, presence: true
  scope :by_name, -> { order(:name) }
  default_scope { by_name }
end

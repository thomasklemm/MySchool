class Klass < ActiveRecord::Base
  belongs_to :school_year
  has_many :klass_students
  has_many :students, through: :klass_students
  has_many :parents, -> { uniq }, through: :students
  has_many :course_klasses
  has_many :courses, through: :course_klasses
  has_many :teachers, -> { uniq }, through: :courses
  has_many :tests
  validates :school_year_id, :name, presence: true
  scope :by_name, -> { order(:name) }
end

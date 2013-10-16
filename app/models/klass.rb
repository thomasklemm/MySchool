class Klass < ActiveRecord::Base
  belongs_to :school_year, inverse_of: :klasses
  has_many :klass_students
  has_many :students, through: :klass_students
  has_many :parents, -> { uniq.reorder(:last_name, :first_name) }, through: :students
  has_many :course_klasses
  has_many :courses, through: :course_klasses
  has_many :teachers, -> { uniq.reorder(:last_name, :first_name) }, through: :courses
  has_many :tests, inverse_of: :klass
  validates :school_year_id, :name, presence: true
  scope :by_name, -> { order(:name) }
  default_scope { by_name }
end

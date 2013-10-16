class Student < ActiveRecord::Base
  belongs_to :school
  has_many :student_parents
  has_many :parents, through: :student_parents
  has_many :student_klasses, class_name: 'KlassStudent'
  has_many :klasses, through: :student_klasses
  has_many :student_courses, class_name: 'CourseStudent'
  has_many :courses, through: :student_courses
  validates :school_id, :first_name, :last_name, presence: true
  validates :email, email: { allow_blank: true }
  localize_field :date_of_birth
  scope :by_name, -> { order(:last_name, :first_name) }
  default_scope { by_name }

  def name
    "#{first_name} #{last_name}"
  end

  def klass_in(school_year)
    @klass_in_school_year ||= klasses.find_by(school_year_id: school_year.id)
  end

  def klass_name_in(school_year)
    klass_in(school_year).try(:name)
  end
end

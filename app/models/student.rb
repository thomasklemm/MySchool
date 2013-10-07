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

  def name
    "#{first_name} #{last_name}"
  end

  def name_and_current_klass
    "#{name} (#{current_klass.name})"
  end

  def current_klass
    klasses.first
  end
end

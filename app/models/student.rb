class Student < ActiveRecord::Base
  belongs_to :school

  has_many :student_klasses, class_name: 'KlassStudent'
  has_many :klasses, through: :student_klasses

  validates :school_id, :first_name, :last_name, presence: true
  validates :email, email: { allow_blank: true }

  def name
    "#{first_name} #{last_name}"
  end

  def current_klass
    klasses.first
  end
end

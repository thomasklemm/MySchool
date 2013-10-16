class Teacher < ActiveRecord::Base
  belongs_to :school
  has_many :courses
  has_many :klasses, -> { uniq }, through: :courses
  has_many :students, -> { uniq }, through: :courses
  validates :school_id, :first_name, :last_name, presence: true
  validates :email, email: { allow_blank: true }
  localize_field :date_of_birth
  scope :by_name, -> { order(:last_name, :first_name) }

  def name
    "#{first_name} #{last_name}"
  end

  def klasses_in(school_year)
    @klasses_in_school_year ||= klasses.where(school_year_id: school_year.id)
  end
end

class Parent < ActiveRecord::Base
  belongs_to :school, inverse_of: :parents
  has_many :student_parents
  has_many :students, through: :student_parents
  # Reordering removes the default scope (ordering) from students
  has_many :klasses, -> { uniq.reorder(:name) }, through: :students
  validates :school_id, :last_name, :first_name, presence: true
  localize_field :date_of_birth
  scope :by_name, -> { order(:last_name, :first_name) }
  default_scope { by_name }

  def name
    "#{first_name} #{last_name}"
  end

  def klasses_in(school_year)
    @klasses_in_school_year ||= klasses.where(school_year_id: school_year.id)
  end
end

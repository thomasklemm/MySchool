class Parent < ActiveRecord::Base
  belongs_to :school
  has_many :student_parents
  has_many :students, through: :student_parents
  validates :school_id, :last_name, :first_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end

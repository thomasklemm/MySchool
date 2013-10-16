class School < ActiveRecord::Base
  has_many :school_years, inverse_of: :school
  belongs_to :default_school_year, class_name: 'SchoolYear'
  has_many :teachers, inverse_of: :school
  belongs_to :headmaster, class_name: 'Teacher'
  belongs_to :deputy_headmaster, class_name: 'Teacher'
  has_many :students, inverse_of: :school
  has_many :parents, inverse_of: :school
  validates :name, presence: true
end

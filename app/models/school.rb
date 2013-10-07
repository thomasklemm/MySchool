class School < ActiveRecord::Base
  has_many :school_years
  has_many :teachers
  has_many :students
  has_many :parents
  validates :name, presence: true
end

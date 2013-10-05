class School < ActiveRecord::Base
  has_many :students
  has_many :teachers
  has_many :klasses
  has_many :school_years
  validates :name, presence: true
end

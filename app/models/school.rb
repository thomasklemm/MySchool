class School < ActiveRecord::Base
  has_many :students
  has_many :teachers
  validates :name, presence: true
end

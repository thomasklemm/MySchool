class SchoolYear < ActiveRecord::Base
  belongs_to :school
  has_many :klasses
  has_many :courses
  validates :school_id, :name, :start_date, :end_date, presence: true
end

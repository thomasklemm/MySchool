class SchoolYear < ActiveRecord::Base
  belongs_to :school
  has_many :klasses
  validates :name, :starts_on, :ends_on, presence: true
end

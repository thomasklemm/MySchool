class SchoolYear < ActiveRecord::Base
  belongs_to :school
  validates :name, :starts_on, :ends_on, presence: true
end

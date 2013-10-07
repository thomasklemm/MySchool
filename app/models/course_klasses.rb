class CourseKlasses < ActiveRecord::Base
  belongs_to :course
  belongs_to :klass
end

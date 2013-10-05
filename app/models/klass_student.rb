class KlassStudent < ActiveRecord::Base
  belongs_to :klass
  belongs_to :student
end

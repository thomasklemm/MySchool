class Test < ActiveRecord::Base
  belongs_to :klass
  belongs_to :teacher
  validates :name, :date, :klass_id, :teacher_id, presence: true
end

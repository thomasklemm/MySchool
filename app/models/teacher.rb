class Teacher < ActiveRecord::Base
  belongs_to :school
  validates :school_id, :first_name, :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end

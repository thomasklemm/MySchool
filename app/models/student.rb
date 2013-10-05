class Student < ActiveRecord::Base
  belongs_to :school
  validates :school_id, :first_name, :last_name, presence: true
  validates :email, email: { allow_blank: true }

  def name
    "#{first_name} #{last_name}"
  end
end

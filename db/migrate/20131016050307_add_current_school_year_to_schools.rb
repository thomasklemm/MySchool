class AddCurrentSchoolYearToSchools < ActiveRecord::Migration
  def change
    add_reference :schools, :current_school_year
  end
end

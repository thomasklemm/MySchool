class AddCurrentSchoolYearToSchools < ActiveRecord::Migration
  def change
    add_reference :schools, :default_school_year
  end
end

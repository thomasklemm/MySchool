class CreateSchoolYears < ActiveRecord::Migration
  def change
    create_table :school_years do |t|
      t.belongs_to :school, index: true
      t.text :name
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end

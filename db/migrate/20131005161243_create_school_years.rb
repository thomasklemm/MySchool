class CreateSchoolYears < ActiveRecord::Migration
  def change
    create_table :school_years do |t|
      t.belongs_to :school, index: true
      t.text :name
      t.date :starts_on
      t.date :ends_on

      t.timestamps
    end
  end
end

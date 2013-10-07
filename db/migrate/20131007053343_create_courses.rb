class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.belongs_to :school_year, index: true
      t.text :name
      t.belongs_to :teacher, index: true

      t.timestamps
    end
  end
end

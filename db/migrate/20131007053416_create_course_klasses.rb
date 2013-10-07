class CreateCourseKlasses < ActiveRecord::Migration
  def change
    create_table :course_klasses do |t|
      t.belongs_to :course, index: true
      t.belongs_to :klass, index: true

      t.timestamps
    end
  end
end

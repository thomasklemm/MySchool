class CreateStudentParents < ActiveRecord::Migration
  def change
    create_table :student_parents do |t|
      t.belongs_to :student, index: true
      t.belongs_to :parent, index: true

      t.timestamps
    end
  end
end

class CreateKlassStudents < ActiveRecord::Migration
  def change
    create_table :klass_students do |t|
      t.belongs_to :klass, index: true
      t.belongs_to :student, index: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end

class CreateKlassStudents < ActiveRecord::Migration
  def change
    create_table :klass_students do |t|
      t.belongs_to :klass, index: true
      t.belongs_to :student, index: true
      t.date :from
      t.date :to

      t.timestamps
    end
  end
end

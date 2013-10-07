class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.text :name
      t.belongs_to :teacher, index: true

      t.timestamps
    end
  end
end

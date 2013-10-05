class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.belongs_to :school, index: true
      t.text :last_name
      t.text :first_name
      t.text :form_of_address
      t.text :gender
      t.date :date_of_birth
      t.text :email
      t.text :shorthand_symbol

      t.timestamps
    end
  end
end

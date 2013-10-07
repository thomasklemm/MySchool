class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.belongs_to :school, index: true
      t.text :last_name
      t.text :first_name
      t.text :form_of_address
      t.text :gender
      t.date :date_of_birth
      t.text :email

      t.timestamps
    end
  end
end

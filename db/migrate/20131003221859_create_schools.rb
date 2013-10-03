class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.text :name
      t.text :street
      t.text :zip_code
      t.text :town
      t.text :country
      t.text :phone
      t.text :fax
      t.text :email
      t.text :web_page

      t.timestamps
    end
  end
end

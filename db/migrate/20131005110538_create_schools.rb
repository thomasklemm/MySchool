class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.text :name
      t.text :street
      t.text :postal_code
      t.text :city
      t.text :country
      t.text :phone
      t.text :fax
      t.text :email
      t.text :web_page

      t.timestamps
    end
  end
end

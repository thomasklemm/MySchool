class CreateKlasses < ActiveRecord::Migration
  def change
    create_table :klasses do |t|
      t.belongs_to :school_year, index: true
      t.text :name

      t.timestamps
    end
  end
end

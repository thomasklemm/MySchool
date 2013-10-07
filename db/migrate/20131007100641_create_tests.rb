class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.belongs_to :klass, index: true
      t.text :name
      t.date :date
      t.belongs_to :teacher, index: true

      t.timestamps
    end
  end
end

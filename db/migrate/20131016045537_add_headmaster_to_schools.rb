class AddHeadmasterToSchools < ActiveRecord::Migration
  def change
    add_reference :schools, :headmaster
    add_reference :schools, :deputy_headmaster
  end
end

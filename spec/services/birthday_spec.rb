require 'spec_helper'

describe Birthday do
  describe "#today?" do
    it "returns true if the birthday is today" do
      b =  Birthday.new('1988-08-03'.to_date, '1998-08-03'.to_date, '1999-08-02'.to_date)
      p b.birthday_in_term
      p b.current_age
      p b.age_on_birthday_in_term
    end
  end
end

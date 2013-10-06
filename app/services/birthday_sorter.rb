BirthdaySorter = Struct.new(:students) do
  def sort_by_birthday_in_school_year(school_year)
    result = students.sort_by { |student| [student.date_of_birth.month, student.date_of_birth.day] }

    birthdays = {after: [], before: []}
    soy = school_year.starts_on

    result.each do |student, hash|
      dob = student.date_of_birth
      birthdays[:before] << student if dob.month < soy.month || (dob.month == soy.month && dob.mday < dob.mday)
      birthdays[:after] << student if dob.month > soy.month || (dob.month == soy.month && dob.mday >= dob.mday)
    end

    result = birthdays[:after] + birthdays[:before]
  end
end

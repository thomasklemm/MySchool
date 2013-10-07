# BirthdaySorter
#
# Sorts a given set of students by their birthdays in a given school year
#
BirthdaySorter = Struct.new(:students) do
  def sort_by_birthday_in_school_year(start_date)
    result = students.sort_by { |student| [student.date_of_birth.month, student.date_of_birth.day] }

    birthdays = {after: [], before: []}

    result.each do |student, hash|
      dob = student.date_of_birth
      birthdays[:before] << student if dob.month < start_date.month || (dob.month == start_date.month && dob.mday < dob.mday)
      birthdays[:after] << student if dob.month > start_date.month || (dob.month == start_date.month && dob.mday >= dob.mday)
    end

    result = birthdays[:after] + birthdays[:before]
  end
end

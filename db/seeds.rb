require('pry-byebug')
require_relative('../models/member')
require_relative('../models/workout')
require_relative('../models/booking')

Booking.delete_all()
Workout.delete_all()
Member.delete_all()

member1 = Member.new({
    "first_name" => "Malcolm",
    "last_name" => "Holwill",
    "dob" => "1987/04/08",
    "goal" => "To build muscle",
    "image" => "avatar.png"
  })
member1.save()

member2 = Member.new({
    "first_name" => "Charlie",
    "last_name" => "Bryce",
    "dob" => "1991/01/08",
    "goal" => "Lose Weight",
    "image" => "IMG_5025.JPG"
  })
member2.save()

member3 = Member.new({
    "first_name" => "Graham",
    "last_name" => "Grahamson",
    "dob" => "1975/10/04",
    "goal" => "To improve fitness",
    "image" => "IMG_5025.JPG"
  })
member3.save()

member4 = Member.new({
    "first_name" => "Robert",
    "last_name" => "Smith",
    "dob" => "1993/08/10",
    "goal" => "To build muscle and stay fit",
    "image" => "avatar.png"
  })
member4.save()

member5 = Member.new({
    "first_name" => "Alison",
    "last_name" => "Smith",
    "dob" => "2002/12/12",
    "goal" => "To improve flexability and weightloss",
    "image" => "IMG_5025.JPG"
  })
member5.save()

member6 = Member.new({
    "first_name" => "Tommy",
    "last_name" => "Ryder",
    "dob" => "1996/02/20",
    "goal" => "To build muscle",
    "image" => "IMG_5025.JPG"
  })
member6.save()

workout1 = Workout.new({
    "name" => "Fit in 30",
    "type" => "HIIT",
    "trainer" => "Craig",
    "day_of_week" => "Monday",
    "start_time" => "08:00:00",
    "end_time" => "09:00:00"
  })
workout1.save()

workout2 = Workout.new({
    "name" => "Olympic Lifts",
    "type" => "Strength and Conditioning",
    "trainer" => "Davy",
    "day_of_week" => "Monday",
    "start_time" => "19:00:00",
    "end_time" => "20:00:00"
  })
workout2.save()

workout3 = Workout.new({
    "name" => "Boxercise",
    "type" => "HIIT",
    "trainer" => "Ryan",
    "day_of_week" => "Wednesday",
    "start_time" => "06:30:00",
    "end_time" => "08:00:00"
  })
workout3.save()

workout4 = Workout.new({
    "name" => "Energy Flow",
    "type" => "Pilates",
    "trainer" => "Charlotte",
    "day_of_week" => "Friday",
    "start_time" => "13:00:00",
    "end_time" => "14:00:00"
  })
workout4.save()

booking1 = Booking.new({
    "workout_id" => workout1.id,
    "member_id" => member2.id
  })
booking1.save()

booking2 = Booking.new({
    "workout_id" => workout2.id,
    "member_id" => member1.id
  })
booking2.save()

booking3 = Booking.new({
    "workout_id" => workout3.id,
    "member_id" => member4.id
  })
booking3.save()

booking4 = Booking.new({
    "workout_id" => workout4.id,
    "member_id" => member6.id
  })
booking4.save()

# binding.pry
# nil

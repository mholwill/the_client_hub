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
    "age" => 32,
    "goal" => "To build muscle"
  })
member1.save()

member2 = Member.new({
    "first_name" => "Charlie",
    "last_name" => "Bryce",
    "age" => 28,
    "goal" => "Lose Weight"
  })
member2.save()

member3 = Member.new({
    "first_name" => "Graham",
    "last_name" => "Grahamson",
    "age" => 21,
    "goal" => "To improve fitness"
  })
member3.save()

member4 = Member.new({
    "first_name" => "Robert",
    "last_name" => "Smith",
    "age" => 52,
    "goal" => "To build muscle and stay fit"
  })
member4.save()

member5 = Member.new({
    "first_name" => "Alison",
    "last_name" => "Smith",
    "age" => 57,
    "goal" => "To improve flexability and weightloss"
  })
member5.save()

member6 = Member.new({
    "first_name" => "Tommy",
    "last_name" => "Ryder",
    "age" => 19,
    "goal" => "To build muscle"
  })
member6.save()

workout1 = Workout.new({
    "name" => "Fit in 30",
    "type" => "HIIT",
    "trainer" => "Craig",
    "capacity" => 8
  })
workout1.save()

workout2 = Workout.new({
    "name" => "Olympic Lifts",
    "type" => "Strength and Conditioning",
    "trainer" => "Davy",
    "capacity" => 2
  })
workout2.save()

workout3 = Workout.new({
    "name" => "Boxercise",
    "type" => "HIIT",
    "trainer" => "Ryan",
    "capacity" => 8
  })
workout3.save()

workout4 = Workout.new({
    "name" => "Energy Flow",
    "type" => "Pilates",
    "trainer" => "Charlotte",
    "capacity" => 6
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

binding.pry
nil

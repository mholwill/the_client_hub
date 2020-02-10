require_relative('../db/sql_runner')

class Booking

  attr_reader :id, :member_id, :workout_id

  def initialize(options)
    @id = options['id'] if options['id']
    @member_id = options['member_id'].to_i
    @workout_id = options['workout_id'].to_i
  end

  def save()
    sql = "INSERT INTO bookings
    (
      member_id,
      workout_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@member_id, @workout_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM bookings
    WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql,value)
  end

  def members()
    sql = "SELECT * FROM members
    WHERE id = $1"
    value = [@member_id]
    results = SqlRunner.run(sql,value)
    return Member.new(results.first)
  end

  def workouts()
    sql = "SELECT * FROM workouts
    WHERE id = $1"
    value = [@workout_id]
    results = SqlRunner.run(sql,value)
    return Workout.new(results.first)
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    bookings = SqlRunner.run(sql)
    return Booking.map_items(bookings)
  end

  def self.delete_all
    sql = "DELETE FROM bookings"
    SqlRunner.run(sql)
  end

  def self.find(id)
   sql = "SELECT * FROM bookings WHERE id = $1"
   values = [id]
   booking = SqlRunner.run(sql, values)
   result = Booking.new(booking.first)
   return result
 end


  def self.map_items(booking_data)
    result = booking_data.map { |booking| Booking.new(booking) }
    return result
  end



end

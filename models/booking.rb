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

  def self.delete_all
    sql = "DELETE FROM "
  end


  def self.map_items(booking_data)
    result = booking_data.map { |booking| Booking.new(booking) }
    return result
  end



end

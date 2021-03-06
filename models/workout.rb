require_relative('../db/sql_runner')

class Workout

    attr_reader :id
    attr_accessor :name, :type, :trainer, :day_of_week, :start_time, :end_time

  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
    @type = options['type']
    @trainer = options['trainer']
    @day_of_week = options['day_of_week']
    @start_time = options['start_time']
    @end_time = options['end_time']
  end

  def save()
    sql = "INSERT INTO workouts
    (
      name,
      type,
      trainer,
      day_of_week,
      start_time,
      end_time
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @type, @trainer, @day_of_week, @start_time, @end_time]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update
    sql = "UPDATE workouts
    SET (
      name,
      type,
      trainer,
      day_of_week,
      start_time,
      end_time
    )
    =
    (
      $1, $2, $3, $4, $5, $6
    ) WHERE id = $7"
    values = [@name, @type, @trainer, @day_of_week, @start_time, @end_time, @id]
    SqlRunner.run(sql,values)
  end

  def members_booked()
    sql = "SELECT members.* FROM members
   INNER JOIN bookings
   ON bookings.member_id = members.id
   WHERE workout_id = $1"
   value = [@id]
   member_data = SqlRunner.run(sql,value)
   return Member.map_items(member_data)
  end

  def delete()
    sql = "DELETE FROM workouts
    WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql,value)
  end

  def self.all()
    sql = "SELECT * FROM workouts"
    workouts = SqlRunner.run(sql)
    return Workout.map_items(workouts)
  end

  def self.delete_all
    sql = "DELETE FROM workouts"
    SqlRunner.run(sql)
  end

  def self.find(id)
   sql = "SELECT * FROM workouts WHERE id = $1"
   values = [id]
   workout = SqlRunner.run(sql, values)
   result = Workout.new(workout.first)
   return result
 end


  def self.map_items(workout_data)
    result = workout_data.map { |workout| Workout.new(workout) }
    return result
  end

end

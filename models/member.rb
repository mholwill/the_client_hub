# require('date')
require_relative('../db/sql_runner')

class Member

  attr_reader :id
  attr_accessor :first_name, :last_name, :age, :goal

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @goal = options['goal']
  end

  def save()
    sql = "INSERT INTO members
    (
      first_name,
      last_name,
      age,
      goal
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@first_name, @last_name, @age, @goal]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE members
    SET (
      first_name,
      last_name,
      age,
      goal
    )
    =
    (
      $1, $2, $3, $4
    ) WHERE id = $5"
    values = [@first_name, @last_name, @age, @goal, @id]
    SqlRunner.run(sql,values)
  end

  def delete()
    sql = "DELETE FROM members
    WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql,value)
  end

  def workouts_booked()
    sql = "SELECT workouts.* FROM workouts
    INNER JOIN bookings ON
    bookings.workout_id = workouts.id
    WHERE member_id = $1"
    value = [@id]
    workout = SqlRunner.run(sql,value)
    return Workout.map_items(workout)
  end

def self.age_calculator(dob)
  now = Time.now.utc.to_date
  now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
end

  def self.all()
    sql = "SELECT * FROM members"
    members= SqlRunner.run(sql)
    return Member.map_items(members)
  end

  def self.delete_all
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  def self.find(id)
   sql = "SELECT * FROM members WHERE id = $1"
   values = [id]
   member = SqlRunner.run(sql, values)
   result = Member.new(member.first)
   return result
 end

  def self.map_items(member_data)
    result = member_data.map { |member| Member.new(member) }
    return result
  end



end

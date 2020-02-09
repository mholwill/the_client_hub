require_relative('../db/sql_runner')

class Workout

    attr_reader :id, :name, :type, :trainer, :capacity

  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['id']
    @type = options['type']
    @trainer = options['trainer']
    @capacity = options['capacity'].to_i
  end

  def save()
    sql = "INSERT INTO workouts
    (
      name,
      type,
      trainer,
      capacity
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@name, @type, @trainer, @capacity]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end


  def self.map_items(workout_data)
    result = workout_data.map { |workout| Workout.new(workout) }
    return result
  end

end

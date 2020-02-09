require_relative('../db/sql_runner')

class Workout

  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['id']
    @type = options['type']
    @trainer = options['trainer']
    @capacity = options['capacity'].to_i
  end



end

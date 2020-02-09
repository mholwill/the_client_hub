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



end

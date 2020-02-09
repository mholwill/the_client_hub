require_relative('../db/sql_runner')

class Booking

  attr_reader :id, :member_id, :workout_id

  def initialize(options)
    @id = options['id'] if options['id']
    @member_id = options['member_id'].to_i
    @workout_id = options['workout_id'].to_i
  end



end

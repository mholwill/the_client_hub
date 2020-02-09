require_relative('../db/sql_runner')

class Member

  attr_reader :id, :first_name, :last_name, :age, :goal

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

  def self.all()
    sql = "SELECT * FROM members"
    members= SqlRunner.run(sql)
    return Member.map_items(members)
  end

  def self.delete_all
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  def self.map_items(member_data)
    result = member_data.map { |member| Member.new(member) }
    return result
  end



end

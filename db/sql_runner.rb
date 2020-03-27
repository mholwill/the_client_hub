require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({
          host: ENV['HOST_NAME'],
          dbname: ENV['DATABASE_NAME'],
          user: ENV['USER'],
          password: ENV['PASSWORD']
         })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end

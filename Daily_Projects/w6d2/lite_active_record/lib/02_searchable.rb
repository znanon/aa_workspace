require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    results = []
    where_l = params.keys.map { |k| "#{k} = ?" }.join(" AND ")
    results += DBConnection.execute(<<-SQL, *params.values)
    SELECT *
    FROM #{table_name}
    WHERE #{where_l}
    SQL
    parse_all(results)
  end
end

class SQLObject extend Searchable
  # Mixin Searchable here...
end

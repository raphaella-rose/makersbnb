require 'pg'

def persisted_data(id:, table:)
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.query("SELECT * FROM users WHERE id = '#{id}';")
end

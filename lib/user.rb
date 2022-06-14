require 'pg'

class User
  def self.create(email:, password:)
    connection = PG.connect(dbname: 'makersbnb_test')
    result = connection.query(
      "INSERT INTO users (email, password) VALUES($1, $2) RETURNING id, email;",
      [email, password]
    )
    User.new(id: result[0]['id'], email: result[0]['email'])

  end

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end


  
end
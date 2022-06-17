require 'pg'

def setup_test_database

    connection = PG.connect(dbname: 'makersbnb_test')

    # Clear the bookmarks table
    connection.exec("TRUNCATE properties;")
    connection.exec("TRUNCATE users")

end
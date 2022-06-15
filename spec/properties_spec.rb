require 'properties'
require 'pg'

describe Properties do
  describe '.all' do
    it 'returns a list of properties' do
      connection = PG.connect(dbname: 'makersbnb_test')

      connection.exec("INSERT INTO properties (property_title, description, price_per_night) VALUES ('buckingham palace', 'the queens house init?', 300);") #300 might need to be in quotes

      properties = Properties.all

      expect(properties.first.property_title).to include("buckingham palace")
      expect(properties.first.description).to include("the queens house init?")
      expect(properties.first.price_per_night).to include("300")
    end
  end
end 


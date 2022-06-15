require 'pg'

class Properties
  def self.all

    attr_reader :property_title, :description, :price_per_night

    def initialize(property_title:, description:, price_per_night:)
      @property_title  = property_title
      @description = description
      @price_per_night = price_per_night
    end

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
      else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("SELECT * FROM properties")
    result.map do |property|
      Properties.new(property_title: property['property_title'], description: property['description'], price_per_night: property['price_per_night'])
    end
    
  end


end
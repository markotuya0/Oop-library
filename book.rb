class Book
  attr_reader :rentals
  attr_accessor :title, :author

  has_many :rentals
  has_many :persons, through: rentals

  def initialize(title, author, rentals)
    @title = title
    @author = author
    @rentals = rentals
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end

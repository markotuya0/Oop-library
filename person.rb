require './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private_class_method def self.of_age?
    @age >= 18
  end

  def can_use_services?
    if of_age? || @parent_permission
      true
    else
      false
    end
  end
end

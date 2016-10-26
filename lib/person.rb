require 'pry'

class Person

  attr_reader :name
  attr_accessor :cash

  def initialize(name, cash)
    @name = name
    @cash = cash
  end

  def increase_cash(amount)
    @cash = @cash + amount
  end

  def decrease_cash(amount)
    @cash = @cash - amount
  end

end

# person1 = Person.new("Minerva", 1000)
#
# person2 = Person.new("Luna", 500)

require 'pry'

class Person

  attr_reader :name,
              :accounts
  attr_accessor :cash

  def initialize(name, cash)
    puts "#{name} has been created with #{cash} galleons in cash."
    @name = name
    @cash = cash
    @accounts = []
  end

  def increase_cash(amount)
    @cash = @cash + amount
  end

  def decrease_cash(amount)
    @cash = @cash - amount
  end

end

person1 = Person.new("Minerva", 1000)

person2 = Person.new("Luna", 500)

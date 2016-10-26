require 'minitest/autorun'
require 'minitest/pride'
require './lib/person.rb'
require 'pry'

class PersonTest < Minitest::Test

  def test_it_exists
    assert_instance_of Person, Person.new("Minerva", 1000)
  end

  def test_it_has_a_class
    person = Person.new("Minerva", 1000)

    assert_equal Person, person.class
  end

  def test_it_has_name
    person = Person.new("Minerva", 1000)

    assert_equal "Minerva", person.person_name
  end

  def test_it_has_cash
    person = Person.new("Minerva", 1000)

    assert_equal 1000, person.cash
  end

  def test_it_can_decrease_cash
    person = Person.new("Minerva", 1000)

    assert_equal 900, person.decrease_cash(100)
  end

  def test_it_can_increase_cash
    person = Person.new("Minerva", 1000)

    assert_equal 1100, person.increase_cash(100)
  end
end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/bank.rb'
require 'pry'

class BankTest < Minitest::Test

  def test_it_exists
    assert_instance_of Bank, Bank.new("Chase")
  end

  def test_it_has_a_class
    bank = Bank.new("Chase")

    assert_equal Bank, bank.class
  end

  def test_it_has_a_name
    bank = Bank.new("Chase")

    assert_equal "Chase", bank.bank_name
  end

  def test_it_can_open_account
    bank = Bank.new("JP Morgan Chase")
    person = Person.new("Minerva", 1000)

    assert "An account has been opened for Minerva with JP Morgan Chase", bank.open_account(person, bank)
  end

  def test_it_can_accept_deposit
    bank = Bank.new("JP Morgan Chase")
    person = Person.new("Minerva", 1000)
    amount = 200

    assert_equal "200 galleons have been deposited into Minerva's JP Morgan Chase account. Balance: 200 Cash: 800", bank.deposit(person, amount)
  end

  def test_it_cannot_deposit_more_than_cash_available
    person = Person.new("Minerva", 1000)
    bank = Bank.new("JP Morgan Chase")
    amount = 1300

    assert_equal "Minerva does not have enough cash to perform this deposit.", bank.deposit(person, amount)
  end

  def test_withdrawal
    person = Person.new("Minerva", 1000)
    bank = Bank.new("JP Morgan Chase")
    bank.deposit(person, person.cash)
    amount = 250

    assert_equal "Minerva has withdrawn 250 galleons. Balance: 750", bank.withdrawal(person, amount)
  end

  def test_rejects_withdrawal_without_enough_money
    person = Person.new("Minerva", 1000)
    bank = Bank.new("JP Morgan Chase")
    bank.deposit(person, person.cash)
    amount = 1700

    assert_equal "Insufficient funds.", bank.withdrawal(person, amount)
  end

  def test_it_can_transfer_funds_to_another_bank
    person = Person.new("Minerva", 1000)
    chase = Bank.new("JP Morgan Chase")
    chase.deposit(person, person.cash)
    amount = 200


    assert_equal "Minerva has transferred 200 galleons from JP Morgan Chase to Wells Fargo.", chase.transfer(person, "Wells Fargo", 200)
  end

  def test_it_cannot_transfer_if_funds_unsufficient
    person = Person.new("Minerva", 1000)
    chase = Bank.new("JP Morgan Chase")
    chase.deposit(person, person.cash)
    amount = 1700

    assert_equal "Insufficient funds.", chase.transfer(person, "Wells Fargo", 1700)
  end

  def test_it_cannot_transfer_money_to_bank_if_not_a_client
    person = Person.new("Luna", 500)
    chase = Bank.new("Chase")
    amount = 100

    assert_equal "Luna does not have an account with Wells Fargo.", chase.transfer(person, "Wells Fargo", 100)
  end

  def test_it_can_know_balance_account
    person = Person.new("Minerva", 750)
    chase = Bank.new("JP Morgan Chase")
    chase.deposit(person, person.cash)

    assert_equal "Total Cash: 750 galleons.", chase.total_cash
  end

end

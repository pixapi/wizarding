require './lib/person.rb'
require 'pry'

class Bank
  attr_reader :bank_name
              :deposit
  attr_accessor :balance

  def initialize(bank_name)
    puts "#{bank_name} has been created."
    @bank_name = bank_name
    @balance = 0
  end

  def open_account(person, bank)
    person.accounts << bank
    "An account has been opened for #{person.name} with #{bank_name}."
  end

  def deposit(person, amount)
    if amount > person.cash
      "#{person.name} does not have enough cash to perform this deposit."
    else
      increase_balance(person, amount)
      person.decrease_cash(amount)
      "#{amount} galleons have been deposited into #{person.name}'s #{@bank_name} account. Balance: #{@balance} Cash: #{person.cash}"
    end
  end

  def increase_balance(person, amount)
    @balance = @balance + amount
  end

  def decrease_balance(person, amount)
    @balance = @balance - amount
  end

  def total_cash
    "Total Cash: #{@balance} galleons."
  end

  def withdrawal(person, amount)
    if amount > @balance
      "Insufficient funds."
    else
    decrease_balance(person, amount)
    person.increase_cash(amount)
    "#{person.name} has withdrawn #{amount} galleons. Balance: #{@balance}"
    end
  end

  def transfer (person, bank_recipient, amount)
    if person.accounts.include?(bank_recipient) && amount <= @balance
      "#{person.name} has transferred #{amount} galleons from #{@bank_name} to #{bank_recipient}."
      decrease_balance(person, amount)
    elsif amount > @balance
      "Insufficient funds."
    else
      "#{person.name} does not have an account with #{bank_recipient}."
    end
  end
end

chase = Bank.new("Chase")
wellsfargo = Bank.new("Wells Fargo")

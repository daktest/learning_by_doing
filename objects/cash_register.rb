#! /usr/bin/env ruby

class CashRegister
  attr_reader :total

  def initialize
    @total = 0.0
  end

  def purchase(amount)
    @total += amount
  end

  def format_total
    sprintf("$%.2f", total.abs)
  end

  def pay(amount)
    @total -= amount

    if total < 0.0
      puts "Your change is #{format_total}"
      @total = 0.0
    elsif total > 0.0
      puts "Your new total is #{format_total}"
    else
      puts "Thank you for purchasing from us!"
    end
  end
end

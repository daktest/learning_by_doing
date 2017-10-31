# Cash register class
class CashRegister
  attr_reader :total

  def initialize
    @total = 0.0
  end

  def purchase(amount)
    @total += amount
  end

  def format_total
    format('$%.2f', total.abs)
  end

  def pay(amount)
    @total -= amount

    if total < 0.0
      change = "Your change is #{format_total}"
      @total = 0.0
      change
    elsif total > 0.0
      "Your new total is #{format_total}"
    else
      'Thank you for purchasing from us!'
    end
  end
end

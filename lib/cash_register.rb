require 'pry'
class CashRegister

  attr_accessor :total, :discount, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quanity = 1)
    if quanity > 1
      n = 1
      while  n < quanity
        @items << title
        n += 1
      end
    end
    @items << title
    @total += price * quanity
  end

  def apply_discount

    if @discount > 0
      @total -= (@total * (@discount.to_f/100))
      "After the discount, the total comes to $#{@total.to_i}."
    else "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    voided = @items.pop
    @total -=self.total
  end
end

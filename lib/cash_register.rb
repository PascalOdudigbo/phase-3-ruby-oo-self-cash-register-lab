require 'pry'
class CashRegister
    attr_accessor :discount, :total, :quantity
    def initialize(discount = 0)
        @total = 0
        self.discount = discount
        @items = []
        @quantity = []
        @price = []
    end

    def add_item(title, price, quantity = 1)
       
        if quantity > 1
            (1..quantity).each{@items << title}
            (1..quantity).each{@price << price}
            self.quantity << quantity
            self.total += price * quantity
        else
            @items << title
            @price << price
            self.total += price

        end
             
    end
    
    def apply_discount
        if self.discount > 0
            self.total -= self.discount.to_f/100.0 * self.total
            "After the discount, the total comes to $#{self.total.to_i}."
        else 
            "There is no discount to apply."
        end
    end

    def items
        if self.quantity.length == 0
            @items.uniq
        else 
            @items
        end
        #binding.pry
    end

    def void_last_transaction
        self.total = self.total - self.last_transaction
    end
end

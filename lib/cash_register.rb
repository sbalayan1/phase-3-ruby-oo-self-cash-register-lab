class CashRegister
    attr_accessor :total, :discount, :last_transaction
    attr_reader :items

    def initialize discount=0
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = 0
    end

    def add_item title, price, quantity = 1
        self.last_transaction = price * quantity
        self.total += price * quantity
        quantity.times do
            items << title
        end
    end

    def apply_discount
        if discount == 0
           return "There is no discount to apply."
        end
          
        self.total *= 1-(discount/100.to_f)
        "After the discount, the total comes to $#{total.to_i}."
    end

    def void_last_transaction
        self.total -= last_transaction
    end
end


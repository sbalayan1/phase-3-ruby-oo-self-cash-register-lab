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
        self.last_transaction = price * quantity #refers to the last_transaction setter method
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
        self.total -= last_transaction #note upon instanstiation, last_transaction is nil because the variable is not set to any value upon initialization though attr_accessor creates its instance methods. 
    end
end

# register = CashRegister.new(20)
# register.void_last_transaction

# # register.add_item('banana', 50, 5) #total = 250, last_transaction = 250
# # register.void_last_transaction #total = 0
# # register.void_last_transaction
# puts register.total


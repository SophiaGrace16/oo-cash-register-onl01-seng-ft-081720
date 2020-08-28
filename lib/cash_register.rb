require 'pry'

class CashRegister
attr_accessor :total, :discount, :list

    def initialize (discount=0,total=0)
        @total = total
        @discount = discount
        @list = {}
    end

    # def total (total)
    #     total.sum{|item|}
    # end

    def add_item (name, price, quantity = 1)
        # list = {name: [price, quantity]}  
        @list[name]= [price, quantity]
        @total += (quantity*price)
    end

    def apply_discount
        if @discount > 0
            discount_total = (@discount*@total/100)
            @total -= discount_total
         "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        array = []
        @list.each {|key,value| value[1].times {array << key} }
        array
        # @list.inject(Array.new(0)) [array,key]
    end

    def void_last_transaction
        last_item = @list.to_a.pop.flatten
        @total -= last_item[1]*last_item[2]
    end
        
end
  # @cash_register = CashRegister.new
    # @cash_register = CashRegister.new(20)

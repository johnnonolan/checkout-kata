class CheckOut 
	@rules
	@total = 0
	def initialize(rules, discounts)
		@total=0
		@basket = Hash.new
		@rules = rules
		@discounter = Discounter.new(discounts)
	end
	
	def scan sku
		price = @rules[sku]
		if @basket.has_key?(sku)
		   @basket[sku] += 1
		else 
		  @basket[sku] = 1
		end
 		@total += price
	end	
	
	def total
		@total - @discounter.applyDiscounts(@basket)
	end
end


class Discounter
	def initialize(discounts)
		@discounts = discounts
	end
	
	def applyDiscounts(basket)
	  discount =0
	  basket.keys.each{|key| 
	  	if @discounts.has_key?(key) 
	  		sku_discounts = @discounts[key]
	  		no_of_items = basket[key]
	  		sku_discounts.keys.each {|qty| 
	  			while no_of_items >= qty 
	  				discount += sku_discounts[qty]
	  				no_of_items -= qty
	  			end
	  		}	  		
	  		if sku_discounts.has_key?(no_of_items) 
	  			discount += sku_discounts[no_of_items]
	  		end
	  	end
	  }
	  discount
	end
end
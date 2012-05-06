
class CheckOut 
	def initialize(rules, discounts)
		@total=0
		@rules = rules
		@discounter = discounts
		@basket = Basket.new(@discounter)
	end
	
	def scan sku
		price = @rules[sku]
		@basket.Add(sku)
 		@total += price
	end	
	
	def total
		@total - @basket.apply_discounts
	end
end


class Discounter
	def initialize(discounts)
		@discounts = discounts
	end
	
	def apply_discount(sku,qty)
		discount = 0
	  	if @discounts.has_key?(sku) 
	  		sku_discounts = @discounts[sku]
	  
	  		sku_discounts.keys.each {|discounted_qty| 
	  			while qty >= discounted_qty 
	  				discount += sku_discounts[discounted_qty]
	  				qty -= discounted_qty
	  			end
	  		}	  		
	  		if sku_discounts.has_key?(qty) 
	  			discount += sku_discounts[qty]
	  		end
	  	end
	  	discount	
	end
	
end

class Basket
	def initialize(discounts)
		@discounts = Discounter.new(discounts)
		@basket = Hash.new
	end
	
	def Add(sku)
		if @basket.has_key?(sku)
		   @basket[sku] += 1
		else 
		   @basket[sku] = 1
		end
	end
	
	def apply_discounts
	  discount =0
	  puts "hi"
	  @basket.each_pair{|sku,qty| 
	  	discount +=  @discounts.apply_discount(sku,qty)
	  }
	  discount
	end
	
end
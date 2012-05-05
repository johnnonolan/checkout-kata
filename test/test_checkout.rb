require "lib/CheckOut.rb"
require "test/unit"
class TestPrice < Test::Unit::TestCase
   
    PRICES = {"A"=> 50, "B" => 30, "C" => 20, "D" => 15}
    DISCOUNTS = {"A" => {3 => 20}} 
    def price(goods)
		co = CheckOut.new(PRICES,DISCOUNTS)
		goods.split(//).each { |item| co.scan(item) }
		co.total 
    end

    def test_totals
#		assert_equal( 0, price("")) 
#		assert_equal( 50, price("A"))
#		assert_equal( 80, price("AB"))
#		assert_equal(115, price("CDBA"))
#		assert_equal(100, price("AA"))	
#		assert_equal(130, price("AAA"))
#		assert_equal(180, price("AAAA"))
#		assert_equal(230, price("AAAAA"))
#		assert_equal(260, price("AAAAAA"))
		
#		assert_equal(160, price("AAAB"))
		assert_equal(175, price("AAABB"))
    end


end
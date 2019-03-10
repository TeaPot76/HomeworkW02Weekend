require("minitest/autorun")
require('minitest/rg')
require_relative("../drink")
require_relative("../barroom")
require_relative("../room")

require_relative("../guest")
require_relative("../caraokeroom")

class DrinkTest < MiniTest::Test

  def setup
    @drinks =[ @drink1, @drink2, @drink3, @drink4]
    @drink = Drink.new("Corona", 3.0, 2)
  end

  def test_drink_has_name
    assert_equal("Corona", @drink.name())
  end

  def test_drink_has_price
    assert_equal(3.0, @drink.price())
  end

  def test_drink_has_quantity
    assert_equal(2, @drink.quantity())
  end

end

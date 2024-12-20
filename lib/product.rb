class Product
  attr_reader :price, :quantity, :type

  def initialize(price, quantity=1, type="", imported=false, exempt=false)
    @price = price
    @quantity = quantity
    @type = type
    @imported = imported
    @exempt = exempt
  end

  def is_exempt?
    @exempt
  end

  def is_imported?
    @imported
  end

  def ==(other_product)
    (
      @price == other_product.price &&
      is_imported? == other_product.is_imported? &&
      is_exempt? == other_product.is_exempt? &&
      @type == other_product.type &&
      @quantity == other_product.quantity
    )
  end
end

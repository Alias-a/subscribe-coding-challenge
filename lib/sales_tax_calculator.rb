class SalesTaxCalculator
  IMPORT_TAX_RATE = 0.05.freeze
  SALES_TAX_RATE = 0.10.freeze

  def self.calculate(products)
    total_without_tax = 0
    total_with_tax = 0

    products.each do |product|
      product_price_totals = self.calculate_product_price_totals(product)
      total_without_tax += product_price_totals[:total_without_tax]
      total_with_tax += product_price_totals[:total_with_tax]
    end

    total_tax_rate = total_with_tax / total_without_tax
    # TODO talk with a PM or business rep to understand their rounding rules for total tax rate
    # The examples don't make sense and it's not clear if the output is being represented at a percent or as a decimal
    # I have to assume it's a percent without the percent sign, but if I calculate the total tax rate this way
    # for the first example it would be 3.67 and after rounding I'm not sure what it would be because I'm not sure
    # if I'm meant to be rounding to a 0.05 percent or a 0.05 decimal, I assume decimal
    # which means in the first case the total_tax_rate after rounding to decimal and converting to percent
    # would be 1.05 not 1.5
    {total_tax_rate: ((total_tax_rate-1)*100).round(2), total_with_tax: total_with_tax.round(2)}
  end

  def self.calculate_product_price_totals(product)
    price = product.quantity * product.price
    total_without_tax = price

    tax_rate = 1.0
    tax_rate += SALES_TAX_RATE unless product.is_exempt?
    tax_rate += IMPORT_TAX_RATE if product.is_imported?

    price *= tax_rate.round(2)

    {total_with_tax: price, total_without_tax: total_without_tax}
  end

  def self.round_total_with_tax(total_with_tax)
    (total_with_tax*20).round / 20.0
  end
end

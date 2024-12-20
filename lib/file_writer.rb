require_relative("./sales_tax_calculator")

class FileWriter
  FILE_OUTPUT_PATH = File.join(File.dirname(__FILE__),  "/../output/out.txt").freeze

  def self.write_file(products)
    File.open(FILE_OUTPUT_PATH, 'w') do |f|
      products.each do |product|
        product_calculations = SalesTaxCalculator.calculate_product_price_totals(product)
        # TODO: figure out when to apply rounding
        # It's unclear when this rounding is used and when it is not, it appears to only be used when
        # tax is applied and there is a precision beyond 2
        # rounded_total_with_tax = SalesTaxCalculator.round_total_with_tax(product_calculations[:total_with_tax])
        f.write("#{product.quantity}  #{product.type}: #{product_calculations[:total_with_tax].round(2)}\n")
      end

      order_calculations = SalesTaxCalculator.calculate(products)
      f.write("Sales Taxes: #{order_calculations[:total_tax_rate]}\n")
      f.write("Total: #{order_calculations[:total_with_tax]}\n")
    end
  end
end

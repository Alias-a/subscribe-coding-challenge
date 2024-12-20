require_relative '../lib/sales_tax_calculator'
require_relative '../lib/product'
require_relative './spec_helper'

describe SalesTaxCalculator do
  let(:sample_1_products) { [
    Product.new(12.49, 2,"book", false, true),
    Product.new(14.99, 1, "music CD", false, false),
    Product.new(0.85, 1, "chocolate bar", false, true)
  ] }
  let(:sample_2_products) { [
    Product.new(10, 1, "box of chocolates", true, true),
    Product.new(47.5, 1, "bottle of perfume",true, false)
  ] }
  let(:sample_3_products) { [
    Product.new(27.99, 1, "bottle of perfume", true, false),
    Product.new(18.99, 1, "bottle of perfume", false, false),
    Product.new(9.75, 1, "packet of headache pills", false, true),
    Product.new(11.25, 3, "boxes of chocolates", true, true)
  ] }

  # TODO figure out expectation for Sales Taxes after figuring out how that's meant to be computed
  # TODO fix failing test once figuring out when the rounding should be done
  describe '#calculate' do
    context 'it correctly calculates the total Sales Tax percentage for' do
      it 'sample_1 products' do
        result = subject.class.calculate(sample_1_products)
        expect(result[:total_with_tax]).to eq(42.32)
      end

      it 'sample_2 products' do
        result = subject.class.calculate(sample_2_products)
        expect(result[:total_with_tax]).to eq(65.15)
      end

      it 'sample_3 products' do
        result = subject.class.calculate(sample_3_products)
        expect(result[:total_with_tax]).to eq(98.38)
      end
    end
  end
end

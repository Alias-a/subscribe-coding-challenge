require_relative '../lib/file_parser'
require_relative './spec_helper'

describe FileParser do
  FIXTURES_PATH = "../spec/fixtures".freeze
  let(:sample_1) {File.join(File.dirname(__FILE__), FIXTURES_PATH, "sample_1.txt")}
  let(:sample_2) {File.join(File.dirname(__FILE__), FIXTURES_PATH, "sample_2.txt")}
  let(:sample_3) {File.join(File.dirname(__FILE__), FIXTURES_PATH, "sample_3.txt")}

  describe "#parse_file" do
    context "correctly parses a valid file and returns the expected product array" do
      it "with sample_1" do
        products = subject.class.parse_file(sample_1)
        expected_products = [
          Product.new(12.49, 2,"book", false, true),
          Product.new(14.99, 1, "music CD", false, false),
          Product.new(0.85, 1, "chocolate bar", false, true)
        ].freeze
        expect(products).to eq(expected_products)
      end

      it "with sample_2" do
        products = subject.class.parse_file(sample_2)
        expected_products = [
          Product.new(10, 1, "box of chocolates", true, true),
          Product.new(47.5, 1, "bottle of perfume",true, false)
        ].freeze
        expect(products).to eq(expected_products)
      end

      it "with sample_3" do
        products = subject.class.parse_file(sample_3)
        expected_products = [
          Product.new(27.99, 1, "bottle of perfume", true, false),
          Product.new(18.99, 1, "bottle of perfume", false, false),
          Product.new(9.75, 1, "packet of headache pills", false, true),
          Product.new(11.25, 3, "boxes of chocolates", true, true)
        ].freeze
        expect(products).to eq(expected_products)
      end
    end
  end
end

require_relative '../lib/main'
require_relative './spec_helper'

describe Main do
  it "loads" do
    expect(Main).to be_a Module
  end

  # TODO fix failing tests once clarifying requirements on how "Sales Taxes" is calculated
  # and when to use special rounding rules
  describe "#process_order" do
    FIXTURES_PATH = "../spec/fixtures".freeze
    let(:sample_1) { File.join(File.dirname(__FILE__), FIXTURES_PATH, "sample_1.txt") }
    let(:sample_2) { File.join(File.dirname(__FILE__), FIXTURES_PATH, "sample_2.txt") }
    let(:sample_3) { File.join(File.dirname(__FILE__), FIXTURES_PATH, "sample_3.txt") }

    context 'correctly processes the order file:' do
      it 'with sample_1' do
        subject.process_order(sample_1)
        expect(read_output("out")).to eq(
                                        "2  book: 24.98\n" +
                                          "1  music CD: 16.49\n" +
                                          "1  chocolate bar: 0.85\n" +
                                          "Sales Taxes: 1.50\n" +
                                          "Total: 42.32\n"
                                      )
      end

      it 'with sample_2' do
        subject.process_order(sample_2)
        expect(read_output("out")).to eq(
                                        "1 imported box of chocolates: 10.50\n" +
                                          "1 imported bottle of perfume: 54.65\n" +
                                          "Sales Taxes: 13.26\n" +
                                          "Total: 65.15\n"
                                      )
      end

      it 'with sample_3' do
        subject.process_order(sample_3)
        expect(read_output("out")).to eq(
                                        "1 imported bottle of perfume: 32.19\n" +
                                          "1 bottle of perfume: 20.89\n" +
                                          "1 packet of headache pills: 9.75\n" +
                                          "3 imported box of chocolates: 35.55\n" +
                                          "Sales Taxes: 7.90\n" +
                                          "Total: 98.38\n"
                                      )
      end
    end
  end
end

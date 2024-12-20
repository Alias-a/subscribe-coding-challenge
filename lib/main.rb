Dir[File.join(File.dirname(__FILE__),  '*.rb')].each {|file| require file }

module Main
  def self.process_order(order_file_path)
    puts "Parsing file at: #{order_file_path}"
    products = FileParser.parse_file(order_file_path)
    puts "Parsing Complete"

    puts "Writing Parsing Results to: #{FileWriter::FILE_OUTPUT_PATH}"
    FileWriter.write_file(products)
    puts "Writing Complete"
  end
end

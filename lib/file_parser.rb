require_relative "./product"

class FileParser
  EXEMPT_TYPES = Set.new(["book",
                          "chocolate bar",
                          "box of chocolates",
                          "boxes of chocolates",
                          "packet of headache pills"]).freeze

  def self.parse_file(file_path)
    products = []

    begin
      File.foreach(file_path) do |line|
        products.push(self.parse_product(line))
      end
    rescue StandardError => e
      puts "There was a problem reading the product file at: #{file_path}"
      puts "Exception: #{e}"
    end

    products
  end

  def self.parse_product(product_line)
    # We don't know what string is going to be used to determine a product's type
    # This leads to a challenging categorization problem to solve
    # We could map out every string to a class for example a Book class that inherits from Product
    # That would always be exempt
    # But our system doesn't care about whether or not something is a Book or not, it simply cares if it is exempt
    # For this reason I'll keep a static map of types and make some strong assumptions that
    # the incoming strings will be limited to those shown in the examples.
    # In this way we can know how to instantiate product and we don't have to implement a cumbersome amount of classes
    # that our system doesn't care about.
    # In the real world I might lean on an AI integration to solve what "Type" of product it is or
    # would need assurances that the list is static and that a "Type" is included in the input so no guesswork
    # needs to be done
    product_parts = product_line.split(/\s*(^\d+|\s+at\s+|imported)\s*/)

    imported_index = product_parts.index("imported")
    is_imported = !imported_index.nil?

    product_quantity = product_parts[1].to_i

    type_location = is_imported ? (imported_index+1) : 2
    product_type = product_parts[type_location]

    is_exempt = EXEMPT_TYPES.include?(product_type)

    Product.new(
      product_parts.last.to_f,
      product_quantity,
      product_type,
      is_imported,
      is_exempt
    )
  end

  private_class_method :parse_product
end

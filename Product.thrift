/*
 * Product.thrift - Defines the Product struct using Apache Thrift IDL.
 */

// Define the namespace for different code generators (optional)
namespace java com.example.model
namespace cpp product

// Define the Product struct
struct Product {
  1: i64 id,                    // Unique identifier for the product
  2: string name,              // Name of the product
  3: string description,       // Detailed description of the product
  4: double price,             // Price of the product
  5: i32 stock_quantity,       // Number of items in stock
  6: list<string> tags,        // List of tags associated with the product
  7: bool is_active = true     // Whether the product is currently active for sale
}
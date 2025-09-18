// Product.thrift
// Definition of a Product struct for use with Apache Thrift

namespace java com.example.product
namespace py product

struct Product {
  1: required i32 id,
  2: required string name,
  3: optional string description,
  4: optional double price,
  5: optional i32 quantity,
  6: optional bool inStock = true,
  7: optional string category
}
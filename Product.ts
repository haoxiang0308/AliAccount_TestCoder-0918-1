// Product class definition
export class Product {
  id: number;
  name: string;
  price: number;

  constructor(id: number, name: string, price: number) {
    this.id = id;
    this.name = name;
    this.price = price;
  }

  // Method to display product information
  getInfo(): string {
    return `Product ID: ${this.id}, Name: ${this.name}, Price: $${this.price.toFixed(2)}`;
  }
}
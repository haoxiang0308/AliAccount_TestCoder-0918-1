// Create an example array
const array = [1, 2, 3, 4, 5, "hello", "world", 3.14];

// Using forEach block to iterate through the array and print each element
console.log("Iterating through array using a block:");
array.forEach(function(element) {
  console.log(element);
});

console.log("\nUsing block with index:");
array.forEach((element, index) => {
  console.log(`Index ${index}: ${element}`);
});

console.log("\nUsing map block to transform elements:");
const numericValues = array.filter(item => typeof item === 'number');
const squaredNumbers = numericValues.map(num => num * num);
console.log(`Squared numbers: ${squaredNumbers}`);

// Additional examples of array methods with blocks
console.log("\nUsing filter block:");
const stringElements = array.filter(element => typeof element === 'string');
console.log(`String elements: ${stringElements}`);